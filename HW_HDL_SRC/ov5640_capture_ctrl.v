`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2019 01:24:37 PM
// Design Name: 
// Module Name: ov5640_capture_ctrl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ov5640_capture_ctrl(

input               sys_rst,

// axi lite register IF
input               axil_camera_set_done,
input               axil_capture_req,
output reg          axil_capture_done,
input        [11:0] axil_binary_threshold,

input        [10:0] axil_res_width,
input        [9:0]  axil_res_height,
input        [8:0]  axil_cap_width,
input        [8:0]  axil_cap_height,
input        [2:0]  axil_sample_mask,

// ov5640 IF
input               ov5640_pclk,
input               ov5640_sync,
input               ov5640_href,
input        [7:0]  ov5640_data,
input               ov5640_setup_finish,

// user GPIO input by user
input               user_capture_req,

// output signal to buffer controller module
output wire  [11:0] vga_bram_wdata,
output reg          vga_bram_wen,
output reg   [16:0] vga_bram_waddr,

(*dont_touch = "true"*)output reg   [19:0] cpu_bram_wdata,
output reg          cpu_bram_wen,
output reg   [5:0]  cpu_bram_waddr
);

wire         user_capture_req_p; // p for pulse
wire         axil_capture_req_p;

r_edge_capture p1(.clk(ov5640_pclk), .i(user_capture_req), .o(user_capture_req_p));
r_edge_capture p2(.clk(ov5640_pclk), .i(axil_capture_req), .o(axil_capture_req_p));


localparam   OV_IDLE    = 2'b00;
localparam   OV_CAPTURE = 2'b01;
localparam   OV_READY   = 2'b11;

(*dont_touch = "true"*)reg   [10:0] ov5640_paddr_h;
(*dont_touch = "true"*)reg   [9:0]  ov5640_paddr_v;

(*dont_touch = "true"*)reg          user_f_sw_req;
(*dont_touch = "true"*)reg          user_f_sw_valid;

(*dont_touch = "true"*)reg          cpu_f_sw_req;
(*dont_touch = "true"*)reg          cpu_f_sw_valid;

reg   [1:0]  ov5640_state;

always @ (posedge ov5640_pclk or posedge sys_rst) begin
	if (sys_rst) begin
		user_f_sw_req <= 1'b0;
	end 
	else begin
		if (user_f_sw_valid) begin
			user_f_sw_req <= 1'b0;
		end 
		else if (~axil_camera_set_done && user_capture_req_p) begin
			user_f_sw_req <= 1'b1;
		end 
	end 
end 

always @ (posedge ov5640_pclk or posedge sys_rst) begin
	if (sys_rst) begin
		cpu_f_sw_req <= 1'b0;
	end 
	else begin
		if (cpu_f_sw_valid) begin
			cpu_f_sw_req <= 1'b0;
		end 
		else if (axil_camera_set_done && axil_capture_req_p) begin
			cpu_f_sw_req <= 1'b1;
		end 
	end 
end

// ov5640_state_machine  
always @ (posedge ov5640_pclk or posedge sys_rst) begin
	if (sys_rst) begin
		user_f_sw_valid    <= 1'b0;
		ov5640_paddr_h     <= 'd0;
		ov5640_paddr_v     <= 'd0;
		ov5640_state       <= OV_IDLE;
		axil_capture_done  <= 1'b0;
		cpu_f_sw_valid     <= 1'b0;
		user_f_sw_valid    <= 1'b0;
	end 
	else begin
		case (ov5640_state)
			OV_IDLE: begin
				if (ov5640_setup_finish) begin
					ov5640_state <= OV_CAPTURE;
				end 
			end 
			OV_CAPTURE: begin
				if (ov5640_href) begin
					cpu_f_sw_valid     <= 1'b0;
					user_f_sw_valid    <= 1'b0;
					if (ov5640_paddr_h == axil_res_width*2 - 1'b1) begin
						ov5640_paddr_h <= 'd0;
						if (ov5640_paddr_v == axil_res_height - 1'b1) begin
							ov5640_paddr_v      <='d0;
							ov5640_state        <= OV_READY;
							axil_capture_done   <= 1'b1;
						end 
						else begin
							ov5640_paddr_v   <= ov5640_paddr_v + 1'b1;
						end 
					end
					else begin
						ov5640_paddr_h   <= ov5640_paddr_h + 1'b1;
					end 
				end 
			end 
			OV_READY: begin
				if (ov5640_sync) begin
					if (cpu_f_sw_req || user_f_sw_req) begin
						ov5640_state      <= OV_CAPTURE;
						cpu_f_sw_valid    <= 1'b1;
						user_f_sw_valid   <= 1'b1;
						axil_capture_done <= 1'b0;
					end 
				end 
			end 
		endcase 
	end 
end 

// ov5640 data concatenate
(*dont_touch = "true"*)reg  [15:0]   ov5640_pixel;
(*dont_touch = "true"*)reg           ov5640_data_cnt;
(*dont_touch = "true"*)reg           ov5640_data_cnt_d1;

always @ (posedge ov5640_pclk or posedge sys_rst) begin
	if (sys_rst) begin
		ov5640_data_cnt  <= 1'b0;
		ov5640_pixel     <= 'd0;
	end 
	else if (ov5640_href && ov5640_state == OV_CAPTURE) begin
		ov5640_data_cnt  <= ~ov5640_data_cnt;
		ov5640_pixel     <= {ov5640_pixel[7:0], ov5640_data};
	end 
	else begin
		ov5640_data_cnt  <= 1'b0;
	end 
end 

//  vga_bram and cpu_bram calculate

wire [11:0]   vga_dp_value;

assign vga_dp_value = {ov5640_pixel[15:12], ov5640_pixel[10:7], ov5640_pixel[4:1]};

// vga_bram config
always @ (posedge ov5640_pclk or posedge sys_rst) begin
	if (sys_rst) begin
		vga_bram_waddr <= 'd0;
		vga_bram_wen   <= 'd0;
	end 
	else if ((ov5640_paddr_h[10:1] < axil_cap_width) && (ov5640_paddr_v < axil_cap_height) && ~axil_capture_done) begin
		vga_bram_waddr = ((axil_cap_width - 1'b1 - ov5640_paddr_h[10:1]) + ov5640_paddr_v * axil_cap_width);
		vga_bram_wen   = ov5640_data_cnt;
	end 
	else begin
		vga_bram_waddr = 'd0;
		vga_bram_wen   = 1'b0;
	end 
end 

assign vga_bram_wdata = vga_dp_value;
// cpu bram config
// here every 20 pixel are gathered into 1 20bit data
// so the ov5640_paddr_h[10:0] can be divided into three part
// [10:4]/[3:1]/[0] which represents the patch cnt/8 pixel patch/pixel part 
// because the logic is a little difficult, so the comb logic has been 
// replaced by sequential logic
wire       cpu_bram_value;
reg  [5:0] cpu_bram_waddr_raw;

assign cpu_bram_value = (vga_bram_wdata < axil_binary_threshold) ? 1'b0 : 1'b1;

always @ (posedge ov5640_pclk or posedge sys_rst) begin
	if (sys_rst) begin
		cpu_bram_wen       <= 1'b0;
		ov5640_data_cnt_d1 <= 1'b0;
		cpu_bram_waddr     <= 'd0;
		cpu_bram_waddr_raw <= 'd0;
		cpu_bram_wdata     <= 'd0;
	end 
	else begin
		ov5640_data_cnt_d1 <= ov5640_data_cnt;
		cpu_bram_waddr     <= cpu_bram_waddr_raw;

		if ((ov5640_paddr_h[10:1] < axil_cap_width) && (ov5640_paddr_v < axil_cap_height) && ~axil_capture_done) begin
			if (ov5640_paddr_h[3:1] == axil_sample_mask && ov5640_paddr_v[2:0] == axil_sample_mask) begin

				if (ov5640_data_cnt_d1) begin
					cpu_bram_wdata = {cpu_bram_value, cpu_bram_wdata[18:0]};
				end 

				if (ov5640_paddr_h[10:1] == {7'd19, axil_sample_mask} ||
					ov5640_paddr_h[10:1] == {7'd39, axil_sample_mask}) begin

					cpu_bram_wen       <= ov5640_data_cnt_d1;
					cpu_bram_waddr_raw <= (~ov5640_paddr_h[9] + 2*ov5640_paddr_v[9:3]);
				end 
				else begin
					cpu_bram_wen  <= 1'b0;
				end 
			end
			else begin
				cpu_bram_wen  <= 1'b0;
			end  
		end 
		else begin
			cpu_bram_wen  <= 1'b0;
		end 
	end 
end 


endmodule
