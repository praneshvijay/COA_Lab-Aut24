`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:59 09/11/2024 
// Design Name: 
// Module Name:    MUX321 
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
module MUX321(
    input [31:0] A,
    input [4:0] S,
    output C
    );
	 
	 wire T1, T2;
	 
	 MUX161 M1(A[31:16], S[3:0], T1);
	 MUX161 M2(A[15:0], S[3:0], T2);
	 
	 MUX21 M3({T1, T2}, S[4], C);

endmodule
