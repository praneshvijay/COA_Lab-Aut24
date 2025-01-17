`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:10 09/10/2024 
// Design Name: 
// Module Name:    MUX161 
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
module MUX161(
    input [15:0] A,
    input [3:0] S,
    output C
    );
	 
	 wire T1, T2;
	 
	 MUX81 G1(A[7:0], S[2:0], T1);
	 MUX81 G2(A[15:8], S[2:0], T2);
	 
	 MUX21 G3({T2, T1}, S[3], C);

endmodule
