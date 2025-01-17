`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:45 09/04/2024 
// Design Name: 
// Module Name:    FA 
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
module FA(
    input A,
    input B,
    input CIN,
    output S,
    output COUT
    );
	 
	 wire T1, T2, T3, T4, T5;
	
	 xor G1(T1, A, B);
	 xor G2(S, T1, CIN); 
	
	 and G3(T2, T1, CIN);
	 and G4(T3, A, B);
	 or G7(COUT, T2, T3);

endmodule
