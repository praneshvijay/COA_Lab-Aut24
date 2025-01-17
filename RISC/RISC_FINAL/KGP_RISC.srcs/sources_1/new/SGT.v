`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 02:19:24
// Design Name: 
// Module Name: SGT
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


module SGT #(parameter N = 32)
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

