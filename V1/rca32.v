`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:10:12 08/14/2024 
// Design Name: 
// Module Name:    rca32 
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
module rca32(output [31:0] s, output cout, input [31:0] a, input [31:0] b, input cin);

	wire t1;

	rca16 g1(s[15:0], t1, a[15:0], b[15:0], cin);
	rca16 g2(s[31:16], cout, a[31:16], b[31:16], t1);

endmodule
