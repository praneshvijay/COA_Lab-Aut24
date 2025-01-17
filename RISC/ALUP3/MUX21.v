`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:27 09/10/2024 
// Design Name: 
// Module Name:    MUX21 
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
module MUX21(
    input [1:0] A,
    input S,
    output C
    );
	 
	 wire T1, T2, T3;
	 not G1(T1, S);
	 and G2(T2, A[0], T1);
	 and G3(T3, A[1], S);
	 or G4(C, T2, T3);

endmodule
