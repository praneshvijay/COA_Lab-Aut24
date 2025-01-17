`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:22 08/14/2024 
// Design Name: 
// Module Name:    cla16_lcu 
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
module cla16_lcu(output [15:0] s, output cout, output [3:0] pout, output [3:0] gout, input [15:0] a, input [15:0] b, input cin);

	wire [4:1] c;
	wire [3:0] P, G;
	
	cla4_aug g1(s[3:0], P[0], G[0], a[3:0], b[3:0], cin);
	cla4_aug g2(s[7:4], P[1], G[1], a[7:4], b[7:4], c[1]);
	cla4_aug g3(s[11:8], P[2], G[2], a[11:8], b[11:8], c[2]);
	cla4_aug g4(s[15:12], P[3], G[3], a[15:12], b[15:12], c[3]);
	
	lcu g5(c, pout, gout, cin, P, G); 
	
	assign cout = c[4];

endmodule
