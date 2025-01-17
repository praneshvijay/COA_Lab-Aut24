`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:41:01 09/10/2024 
// Design Name: 
// Module Name:    HAM 
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
module HAM(
    input [5:0] a,
    output [5:0] s
    );
	 
	 wire [7:0] t1;
	 assign t1[7:6] = 2'b00;
	 assign t1[5:0] = a;
	 
	 wire [3:0] t2;
	 
	 HAM8 g1(t1, t2);
	 
	 assign s[2:0] = t2[2:0];
	 assign s[5:3] = 3'b0;


endmodule
