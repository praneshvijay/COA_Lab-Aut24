`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 01:54:27
// Design Name: 
// Module Name: COMP2
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


module COMP2 #(parameter N = 32)
(
    input [N-1:0] A,
    output [N-1:0] C
    );
	 
	 wire [N-1:0] T;
	 NOT #(.N(N))G1(A, T);
	 ADD #(.N(N)) G2(T, 1, C);

endmodule

