`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:13:54 09/10/2024 
// Design Name: 
// Module Name:    LTST 
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
module LTST(
    input [5:0] a,
    input [5:0] b,
    output [5:0] C
    );
	 
	 wire check;
	 wire [2:0] select;
	 wire [5:0] S;
	 
	 assign select = b[2:0];
	 
	 or g1(check, b[5], b[4], b[3]);
	 
	 MUX81 m5({1'b0, 1'b0, a[0], a[1], a[2], a[3], a[4], a[5]}, select, S[5]);
	 MUX81 m4({1'b0, 1'b0, 1'b0, a[0], a[1], a[2], a[3], a[4]}, select, S[4]);
	 MUX81 m3({1'b0, 1'b0, 1'b0, 1'b0, a[0], a[1], a[2], a[3]}, select, S[3]);
	 MUX81 m2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, a[0], a[1], a[2]}, select, S[2]);
	 MUX81 m1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, a[0], a[1]}, select, S[1]);
	 MUX81 m0({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, a[0]}, select, S[0]);
	 
	 MUX21 o5({1'b0, S[5]}, check, C[5]);
	 MUX21 o4({1'b0, S[4]}, check, C[4]);
	 MUX21 o3({1'b0, S[3]}, check, C[3]);
	 MUX21 o2({1'b0, S[2]}, check, C[2]);
	 MUX21 o1({1'b0, S[1]}, check, C[1]);
	 MUX21 o0({1'b0, S[0]}, check, C[0]);

endmodule
