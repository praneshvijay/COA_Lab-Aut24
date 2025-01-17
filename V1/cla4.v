`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:21:08 08/14/2024 
// Design Name: 
// Module Name:    cla4 
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
module cla4(output [3:0] s, output cout, input [3:0] a, input [3:0] b, input cin);

	wire [3:0] G, P, C;
	
	assign G = a & b;
	assign P = a ^ b;
	
	assign C[0] = cin;
	assign C[1] = (G[0] | (P[0] & cin));
	assign C[2] = (G[1] | (P[1] & (G[0] | (P[0] & cin))));
	assign C[3] = (G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & cin))))));
	
	assign cout = (G[3] | (P[3] & (G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & cin))))))));
	
	assign s = P ^ C;
	
endmodule
