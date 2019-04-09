`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 09:55:36 PM
// Design Name: 
// Module Name: debounce
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


module debounce(

input          clk,
input          rst,

input          i,
output         o
);

reg  [19:0] cnt;

always @ (posedge clk or posedge rst) begin
	if (rst) begin
		cnt <= 'd0;
	end 
	else if (cnt == 'd500000) begin
		cnt <= 'd0;
	end 
	else begin
		cnt <= cnt + 1'b1;
	end 
end 

reg i_d1;

always @ (posedge clk) begin
	if (cnt == 'd500000) begin
		i_d1 <= i;
	end 
end 

assign o = i_d1;


endmodule
