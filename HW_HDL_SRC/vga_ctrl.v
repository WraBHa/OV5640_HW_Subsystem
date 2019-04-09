`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 08:21:42 PM
// Design Name: 
// Module Name: vga_ctrl
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


module vga_ctrl(
input                 sys_rst,

input                 vga_pclk,

output                vga_vsync,
output                vga_hsync,

output reg [16:0]     vga_bram_raddr,
output reg            vga_bram_ren,

input      [8:0]      axil_cap_width,
input      [8:0]      axil_cap_height,
input                 axil_capture_done
);


wire [9:0]    vga_paddr_h;
wire [9:0]    vga_paddr_v;
reg           vga_dp_en  ;

vga_driver  vga_driver_inst(
	.sys_rst               ( sys_rst      ),
	
	.vga_pclk              ( vga_pclk     ),

	.vga_paddr_h           ( vga_paddr_h  ),
	.vga_paddr_v           ( vga_paddr_v  ),
	.vga_hsync             ( vga_hsync    ),
	.vga_vsync             ( vga_vsync    )
);

always @ (*) begin
	if ((vga_paddr_h < axil_cap_width) && (vga_paddr_v < axil_cap_height) && axil_capture_done) begin
		vga_bram_ren    = 1'b1;
		vga_bram_raddr  = vga_paddr_h + vga_paddr_v * axil_cap_width;
	end 
	else begin
		vga_bram_ren    = 1'b0;
		vga_bram_raddr  = 'd0;
	end 
end 

endmodule
