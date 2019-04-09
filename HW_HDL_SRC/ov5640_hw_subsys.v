`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 08:56:23 PM
// Design Name: 
// Module Name: ov5640_hw_subsys
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


module ov5640_hw_subsys(
input           sys_clk,
input           sys_rstn,

// vga IF
output          vga_hsync,
output          vga_vsync,
output [11:0]   vga_pixel,

// ov5640 camera IF
output          ov5640_xclk,
output          ov5640_pwdn,
output          ov5640_rstb,
output          ov5640_sioc,
inout           ov5640_siod,
input           ov5640_pclk,
input           ov5640_href,
input           ov5640_sync,
input  [7:0]    ov5640_data,

// axil reg IF
input           axil_camera_set_done,   // switch
input           axil_capture_req,
output          axil_capture_done,
input  [11:0]   axil_binary_threshold,
input  [10:0]   axil_res_width,
input  [9:0]    axil_res_height,
input  [8:0]    axil_cap_width,
input  [8:0]    axil_cap_height,
input  [2:0]    axil_sample_mask,

// user gpio    
input           user_capture_req,       // botton
input           user_ov5640_setup_start,

// axi4 bram interface
output  [19:0]  axi_bram_wdata,
output          axi_bram_wen,
output  [5:0]   axi_bram_waddr,
output          axi_bram_wclk
 );

assign          axi_bram_wclk = ov5640_pclk;

wire sys_rst;
assign sys_rst = ~sys_rstn;

wire ov5640_setup_finish;

wire [11:0]  vga_bram_wdata;
wire         vga_bram_wen;
wire [16:0]  vga_bram_waddr;
wire [16:0]  vga_bram_raddr;
wire         vga_bram_ren;
wire         vga_pclk;

wire         user_capture_req_o;

debounce debounce1(.clk(sys_clk), .rst(sys_rst), .i(user_capture_req), .o(user_capture_req_o));

ov5640_master   ov5640_master_inst(
	.sys_clk             (  sys_clk   ),
	.sys_rst             (  sys_rst   ),

	.ov5640_rstb         (  ov5640_rstb ),
	.ov5640_pwdn         (  ov5640_pwdn ),
	.ov5640_sccb_siod    (  ov5640_siod ),
	.ov5640_sccb_sioc    (  ov5640_sioc ),
	.ov5640_setup_start  (  user_ov5640_setup_start ),
	.ov5640_setup_finish (  ov5640_setup_finish     )
);

ov5640_capture_ctrl ov5640_capture_ctrl_inst(
	.sys_rst               ( sys_rst    ),

	.axil_camera_set_done  ( axil_camera_set_done ),
	.axil_capture_req      ( axil_capture_req     ),
	.axil_capture_done     ( axil_capture_done    ),
	.axil_binary_threshold ( axil_binary_threshold),
	.axil_res_width        ( axil_res_width       ),
	.axil_res_height       ( axil_res_height      ),
	.axil_cap_width        ( axil_cap_width       ),
	.axil_cap_height       ( axil_cap_height      ),
	.axil_sample_mask      ( axil_sample_mask     ),

	.ov5640_pclk           ( ov5640_pclk          ),
	.ov5640_sync           ( ov5640_sync          ),
	.ov5640_href           ( ov5640_href          ),
	.ov5640_data           ( ov5640_data          ),
	.ov5640_setup_finish   ( ov5640_setup_finish  ),

	.user_capture_req      ( user_capture_req_o   ),

	.vga_bram_wdata        ( vga_bram_wdata       ),
	.vga_bram_wen          ( vga_bram_wen         ),
	.vga_bram_waddr        ( vga_bram_waddr       ),

	.cpu_bram_waddr        ( axi_bram_waddr       ),
	.cpu_bram_wen          ( axi_bram_wen         ),
	.cpu_bram_wdata        ( axi_bram_wdata       )
);

vga_ctrl  vga_ctrl_inst(
	.sys_rst           (  sys_rst           ),

	.vga_pclk          (  vga_pclk          ),
	.vga_vsync         (  vga_vsync         ),
	.vga_hsync         (  vga_hsync         ),
	.vga_bram_raddr    (  vga_bram_raddr    ),
	.vga_bram_ren      (  vga_bram_ren      ),

	.axil_cap_width    (  axil_cap_width    ),
	.axil_cap_height   (  axil_cap_height   ),
	.axil_capture_done (  axil_capture_done )
);

vga_bram_mng vga_bram_mng_inst(
	.vga_bram_wclk     (  ov5640_pclk       ),
	.vga_bram_wen      (  vga_bram_wen      ),
	.vga_bram_wdata    (  vga_bram_wdata    ),
	.vga_bram_waddr    (  vga_bram_waddr    ),

	.vga_bram_rclk     (  vga_pclk          ),
	.vga_bram_ren      (  vga_bram_ren      ),
	.vga_bram_raddr    (  vga_bram_raddr    ),

	.vga_pixel         (  vga_pixel         )
);

clock_gen clk_gen_inst(
	.sys_clk           (  sys_clk   ),
	.sys_rst           (  sys_rst   ),

	.vga_pclk          (  vga_pclk  ),
	.ov5640_xclk       (  ov5640_xclk)
);

endmodule
