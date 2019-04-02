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
input               sys_clk,

// axi lite register IF
input               axil_capture_req,
output              axil_capture_done,
input      [11:0]   axil_binary_threshold,

// ov5640 IF
input               ov5640_pclk,
input               ov5640_sync,
input               ov5640_href,
input        [7:0]  ov5640_data,

// user GPIO input
input               gpio_capture_req,

// output signal to buffer controller module
output       [11:0] vga_bram_wdata,
output              vga_bram_wen,
output       [16:0] vga_bram_waddr,

output       [19:0] cpu_bram_wdata,
output              cpu_bram_wen,
output       [5:0]  cpu_bram_waddr,

    );


endmodule
