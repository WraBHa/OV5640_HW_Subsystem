`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 08:37:15 PM
// Design Name: 
// Module Name: bram_mng
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


module vga_bram_mng(

input                vga_bram_wclk,
input                vga_bram_wen,
input       [11:0]   vga_bram_wdata,
input       [16:0]   vga_bram_waddr,
input                vga_bram_rclk,
input       [16:0]   vga_bram_raddr,
input                vga_bram_ren,

output      [11:0]   vga_pixel

);

wire [11:0]    vga_bram_rdata;

blk_mem_gen_0 vga_bram(
	.addra            (  vga_bram_waddr  ),
	.clka             (  vga_bram_wclk   ),
	.dina             (  vga_bram_wdata  ),
	.ena              (  vga_bram_wen    ),
	.wea              (  vga_bram_wen    ),

	.addrb            (  vga_bram_raddr  ),
	.clkb             (  vga_bram_rclk   ),
	.doutb            (  vga_bram_rdata  ),
	.enb              (  vga_bram_ren    )
);

assign vga_pixel = (vga_bram_ren)? vga_bram_rdata : 12'd0;

endmodule
