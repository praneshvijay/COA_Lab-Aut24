`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:23 08/14/2024 
// Design Name: 
// Module Name:    rca8 
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
module rca8(output [7:0] s, output cout, input [7:0] a, input [7:0] b, input cin);

	wire [6:0] c;
	full_adder g1(s[0], c[0], a[0], b[0], cin);
	full_adder g2(s[1], c[1], a[1], b[1], c[0]);
	full_adder g3(s[2], c[2], a[2], b[2], c[1]);
	full_adder g4(s[3], c[3], a[3], b[3], c[2]);
	full_adder g5(s[4], c[4], a[4], b[4], c[3]);
	full_adder g6(s[5], c[5], a[5], b[5], c[4]);
	full_adder g7(s[6], c[6], a[6], b[6], c[5]);
	full_adder g8(s[7], cout, a[7], b[7], c[6]);


endmodule
