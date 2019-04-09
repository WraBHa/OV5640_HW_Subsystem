`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2019 09:37:59 PM
// Design Name: 
// Module Name: ov5640_master
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


module ov5640_master(
input          sys_clk,
input          sys_rst,

output         ov5640_rstb,
output         ov5640_pwdn,

inout          ov5640_sccb_siod,
output         ov5640_sccb_sioc,

input          ov5640_setup_start,
output         ov5640_setup_finish

);


wire ov5640_setup_done;

ov5640_setup      setup_inst(
	.sys_clk                (   sys_clk      ),
	.sys_rst                (   sys_rst      ),
	
	.ov5640_rstb            (   ov5640_rstb  ),
	.ov5640_pwdn            (   ov5640_pwdn  ),

	.ov5640_setup_start     (   ov5640_setup_start),
	.ov5640_setup_done      (   ov5640_setup_done )
);

sccb_master  sccb_master_inst(
	.sys_rst                (   sys_rst      ),
	.sys_clk                (   sys_clk      ),

	.ov5640_setup_done      (   ov5640_setup_done ),

	.sccb_siod              (   ov5640_sccb_siod  ),
	.sccb_sioc              (   ov5640_sccb_sioc  ),
	.sccb_send_finish       (   ov5640_setup_finish )
);

      


endmodule