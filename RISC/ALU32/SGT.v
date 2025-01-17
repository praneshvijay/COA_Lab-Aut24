`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:28 10/01/2024 
// Design Name: 
// Module Name:    SGT 
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
module SGT #(parameter N = 8)
(
    input [N-1:0] A,
    input [N-1:0] B,
    output [N-1:0] S
);
	 wire [N-1:0] T;
	 
	 SUB #(N) G(B, A, T);
	 
	 assign S[0] = T[N-1];
	 assign S[N-1:1] = 31'b0;
	 
endmodule
