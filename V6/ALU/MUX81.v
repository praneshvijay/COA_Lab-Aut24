`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:21:18 09/10/2024 
// Design Name: 
// Module Name:    MUX81 
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
module MUX81(
    input [7:0] A,
    input [2:0] S,
    output C
    );
	 
	 wire T1, T2;
	 
	 MUX41 G1(A[3:0], S[1:0], T1);
	 MUX41 G2(A[7:4], S[1:0], T2);
	 MUX21 G3({T2, T1}, S[2], C);

endmodule
