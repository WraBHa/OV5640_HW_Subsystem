`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2019 06:45:43 PM
// Design Name: 
// Module Name: clock_gen
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


module clock_gen(

input           sys_clk,
input           sys_rst,

output          vga_pclk,

output          ov5640_xclk
);


clk_wiz_0 pll(
	.sys_clk        (  sys_clk  ),
	.reset          (  sys_rst  ),

	.vga_pclk       (  vga_pclk ),
	.ov5640_xclk    (  ov5640_xclk )
);



endmodule
