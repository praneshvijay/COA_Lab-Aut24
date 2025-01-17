`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:19 08/14/2024 
// Design Name: 
// Module Name:    rca4 
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
module rca4(output [3:0] s, output cout, input [3:0] a, input [3:0] b, input cin);

	wire [2:0] c;
	full_adder g1(s[0], c[0], a[0], b[0], cin);
	full_adder g2(s[1], c[1], a[1], b[1], c[0]);
	full_adder g3(s[2], c[2], a[2], b[2], c[1]);
	full_adder g4(s[3], cout, a[3], b[3], c[2]);
	
endmodule
