`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2019 03:10:03 PM
// Design Name: 
// Module Name: vga_driver
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


// 640*480*60hz

module vga_driver(
// system
input              sys_rst,
// vga interface
input              vga_pclk, //25Mhz

output  reg [9:0]  vga_paddr_h,
output  reg [9:0]  vga_paddr_v,

output  reg        vga_hsync,
output  reg        vga_vsync,

output  wire       vga_dp_en
    );

localparam  H_ACTIVE  = 640;
localparam  H_F_PORCH = 16;
localparam  H_B_PORCH = 48;
localparam  H_SYNC    = 96;

localparam  V_ACTIVE  = 480;
localparam  V_F_PORCH = 10;
localparam  V_B_PORCH = 33;
localparam  V_SYNC    = 2;

reg  acitve_h, active_v;
wire finish_h, finish_v;

assign finish_h = vga_paddr_h == (H_ACTIVE + H_F_PORCH + H_SYNC + H_B_PORCH - 1);
assign finish_v = vga_paddr_v == (V_ACTIVE + V_F_PORCH + V_SYNC + V_B_PORCH - 1);

always @ (posedge vga_pclk or posedge sys_rst) begin
	if (sys_rst) begin
		vga_paddr_h <= 'd0;
	end 
	else if (finish_h) begin
		vga_paddr_h <= 'd0;
	end else begin
		vga_paddr_h <= vga_paddr_h + 1'b1;
	end 
end 

always @ (posedge vga_pclk or posedge sys_rst) begin
	if (sys_rst) begin
		vga_paddr_v <= 'd0;
	end 
	else if (finish_h) begin
		if (finish_v) begin
			vga_paddr_v <= 'd0;
		end 
		else begin
			vga_paddr_v <= vga_paddr_v + 1'b1;
		end 
	end 
end 

always @ (posedge vga_pclk or posedge sys_rst) begin
	if (sys_rst) begin
		acitve_h <= 1'b0;
	end 
	else if (finish_h) begin
		acitve_h <= 1'b1;
	end 
	else if (vga_paddr_h == H_ACTIVE - 1'b1) begin
		acitve_h <= 1'b0;
	end 
end 

always @ (posedge vga_pclk or posedge sys_rst) begin
	if (sys_rst) begin
		active_v <= 1'b0;
	end 
	else if (finish_h) begin
		if (vga_paddr_v == (V_ACTIVE + V_F_PORCH + V_SYNC + V_B_PORCH - 1'b1)) begin
			active_v <= 1'b1;
		end 
		else if (vga_paddr_v == V_ACTIVE - 1'b1) begin
			active_v <= 1'b0;
		end 
	end 
end 

assign vga_dp_en = active_v && acitve_h;

always @ (posedge vga_pclk) begin
    if (vga_paddr_h == H_ACTIVE + H_F_PORCH - 1'b1) begin
		vga_hsync <= 1'b0;
	end 
	else if (vga_paddr_h == H_ACTIVE + H_F_PORCH + H_SYNC - 1'b1) begin
		vga_hsync <= 1'b1;
	end 
end 

always @ (posedge vga_pclk) begin
	 if (finish_h) begin
		if (vga_paddr_v == V_ACTIVE + V_F_PORCH - 1'b1) begin
			vga_vsync <= 1'b0;
		end 
		else if (vga_paddr_v == V_ACTIVE + V_F_PORCH + V_SYNC - 1'b1) begin
			vga_vsync <= 1'b1;
		end 
	end 
end 


endmodule
