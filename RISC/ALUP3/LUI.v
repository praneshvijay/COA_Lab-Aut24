`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:27 10/01/2024 
// Design Name: 
// Module Name:    LUI 
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
module LUI( input [31:0] IMM, output [31:0] DATA);
	
	assign DATA[31:16] = IMM[31:16];
	assign DATA[15:0] = 16'b0;

endmodule
