`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:32:53 09/10/2024 
// Design Name: 
// Module Name:    COMP2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module COMP2 #(parameter N = 8)
(
    input [N-1:0] A,
    output [N-1:0] C
    );
	 
	 wire [N-1:0] T;
	 NOT #(.N(N))G1(A, T);
	 ADD #(.N(N)) G2(T, 1, C);

endmodule
