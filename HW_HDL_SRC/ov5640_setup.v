`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2019 09:34:08 PM
// Design Name: 
// Module Name: ov5640_setup
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


module ov5640_setup(
input          sys_rst,
input          sys_clk,        // 100M clk

input          ov5640_setup_start,

output reg     ov5640_rstb,
output reg     ov5640_pwdn,

output reg     ov5640_setup_done
    );

// revision history

localparam     DELAY_2MS   = 200000;
localparam     DELAY_6MS   = 600000;
localparam     DELAY_20MS  = 2000000;

(*dont_touch = "true"*)reg  [21:0]    cnt;

always @ (posedge sys_clk or posedge sys_rst) begin
	if (sys_rst) begin
		cnt <= 'd0;
	end 
	else if (~ov5640_setup_done && ov5640_setup_start)begin
		cnt <= cnt + 1'b1;
	end 
end 

always @ (posedge sys_clk or posedge sys_rst) begin
	if (sys_rst) begin
		ov5640_rstb       <= 1'b0;
		ov5640_pwdn       <= 1'b1;
		ov5640_setup_done <= 1'b0;
	end 
	else if (~ov5640_setup_done && ov5640_setup_start)begin
		if (cnt == DELAY_6MS - 1) begin
			ov5640_pwdn   <= 1'b0;
		end
		if (cnt == DELAY_6MS + DELAY_2MS - 1) begin
			ov5640_rstb   <= 1'b1;
		end 
		if (cnt == DELAY_6MS + DELAY_2MS + DELAY_20MS - 1) begin
			ov5640_setup_done <= 1'b1;
		end 
	end 
end 

endmodule

