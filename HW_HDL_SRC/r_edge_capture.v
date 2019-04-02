`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2019 02:52:43 PM
// Design Name: 
// Module Name: r_edge_capture
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


module r_edge_capture(
input                clk,
input                i,
output               o
);


reg signal_input_d1;

always @ (posedge clk) begin
	signal_input_d1 <= i;
end 

assign o = {i, signal_input_d1} == 2'b10;

endmodule
