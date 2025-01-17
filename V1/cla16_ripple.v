`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:54:45 08/14/2024 
// Design Name: 
// Module Name:    cla16_ripple 
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
module cla16_ripple(output [15:0] s, output cout, input [15:0] a, input [15:0] b, input cin);
	
	wire [2:0] c;
	
	cla4 g1(s[3:0], c[0], a[3:0], b[3:0], cin);
	cla4 g2(s[7:4], c[1], a[7:4], b[7:4], c[0]);
	cla4 g3(s[11:8], c[2], a[11:8], b[11:8], c[1]);
	cla4 g4(s[15:12], cout, a[15:12], b[15:12], c[2]);

endmodule
