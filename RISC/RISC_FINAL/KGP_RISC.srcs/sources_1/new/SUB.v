`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 01:54:43
// Design Name: 
// Module Name: SUB
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


module SUB #(parameter N = 32)
(
    input [N-1:0] A,
    input [N-1:0] B,
    output [N-1:0] S
);
	 wire [N-1:0] T;
	 
	 COMP2 #(.N(N)) G1(B, T);
	 ADD #(.N(N)) G2(A, T, S);
	 
endmodule
