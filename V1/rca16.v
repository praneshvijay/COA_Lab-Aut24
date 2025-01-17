`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:04:15 08/14/2024 
// Design Name: 
// Module Name:    rca16 
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
module rca16(output [15:0] s, output cout, input [15:0] a, input [15:0] b, input cin);

	wire t1;

	rca8 g1(s[7:0], t1, a[7:0], b[7:0], cin);
	rca8 g2(s[15:8], cout, a[15:8], b[15:8], t1);

endmodule
