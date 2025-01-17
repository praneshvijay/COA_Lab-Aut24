`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:29 08/14/2024 
// Design Name: 
// Module Name:    rca64 
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
module rca64(output [63:0] s, output cout, input [63:0] a, input [63:0] b, input cin);
	 
	wire t1;

	rca32 g1(s[31:0], t1, a[31:0], b[31:0], cin);
	rca32 g2(s[63:32], cout, a[63:32], b[63:32], t1);


endmodule
