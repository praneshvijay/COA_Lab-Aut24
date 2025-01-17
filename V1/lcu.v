`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:50 08/14/2024 
// Design Name: 
// Module Name:    lcu 
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
module lcu(output [4:1] cout, output [3:0] pout, output [3:0] gout, input cin, input [3:0] P, input [3:0] G);
	
	assign cout[1] = (G[0] | (P[0] & cin));
	assign cout[2] = (G[1] | (P[1] & (G[0] | (P[0] & cin))));
	assign cout[3] = (G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & cin))))));
	assign cout[4] = (G[3] | (P[3] & (G[2] | (P[2] & (G[1] | (P[1] & (G[0] | (P[0] & cin))))))));
	
	assign pout = P;
	assign gout = G;

endmodule
