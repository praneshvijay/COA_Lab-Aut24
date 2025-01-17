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
	 AND #(.N(N)) G2(A, B, F2);
	 OR  #(.N(N)) G3(A, B, F3);
	 XOR  #(.N(N)) G4(A, B, F4);
	 NOR   #(.N(N)) G5(A, B, F5);
	 NOT  #(.N(N)) G6(A, F6);
	 LTST32 G7(A, B, F7);
	 RTST32 G8(A, B, F8);
	 RTST_A32 G9(A, B, F9);
	 INC #(.N(N)) G10(A, F10);
	 DEC #(.N(N)) G11(A, F11);
	 SLT #(.N(N)) G12(A, B, F12);
	 SGT #(.N(N)) G13(A, B, F13);
	 LUI G14(A, F14);
	 HAM32  G15(A, F15);

	 SELFUNC #(.N(N)) S(F0, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15, CMD, Z);

endmodule
