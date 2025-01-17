`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:17:31 09/10/2024 
// Design Name: 
// Module Name:    MUX41 
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
module MUX41(
    input [3:0] A,
    input [1:0] S,
    output C
    );
	 
	 wire T1, T2;
	 
	 MUX21 G1(A[1:0], S[0], T1);
	 MUX21 G2(A[3:2], S[0], T2);
	 MUX21 G3({T2, T1}, S[1], C);

endmodule
