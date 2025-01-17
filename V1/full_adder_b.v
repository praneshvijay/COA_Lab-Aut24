`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:43 08/14/2024 
// Design Name: 
// Module Name:    full_adder_b 
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
module full_adder_b(input a, input b, input c0, output s, output c);

	assign s = a ^ b ^ c0;
	assign c = ((a & b) | (b & c0) | (c0 & a));

endmodule

