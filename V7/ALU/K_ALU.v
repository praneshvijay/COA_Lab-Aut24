`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:14 09/10/2024 
// Design Name: 
// Module Name:    K_ALU 
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
module K_ALU #(parameter N = 32)
(
    input [N-1:0] A,
	 input [N-1:0] B,
    input [3:0] CMD,
    output [N-1:0] Z
);

	 wire [N-1:0] F0, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15;
	
	 ADD  #(.N(N)) G0(A, B, F0);
	 SUB  #(.N(N)) G1(A, B, F1);
	 MULT #(.N(N)) G2(A, B, F2);
	 DIV  #(.N(N)) G3(A, B, F3);
	 AND  #(.N(N)) G4(A, B, F4);
	 OR   #(.N(N)) G5(A, B, F5);
	 XOR  #(.N(N)) G6(A, B, F6);
	 NOT  #(.N(N)) G7(A, F7);
	 SELA #(.N(N)) G8(A, B, F8);
	 SELB #(.N(N)) G9(A, B, F9);
	 LTST32 G10(A, B, F10);
	 RTST32 G11(A, B, F11);
	 RTST_A32 G12(A, B, F12);
	 INC  #(.N(N)) G13(A, F13);
	 DEC  #(.N(N)) G14(A, F14);
	 HAM  G15(A, F15);

	 SELFUNC #(.N(N)) S(F0, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15, CMD, Z);

endmodule
