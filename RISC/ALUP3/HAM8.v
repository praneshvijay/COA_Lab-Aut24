`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:41:51 09/10/2024 
// Design Name: 
// Module Name:    HAM8 
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
module HAM8(
    input [7:0] a,
    output [3:0] s
    );
	 
	 wire t4, t5;
	 wire [1:0] t1, t2;
	 wire [2:0] t3;
	 
	 FA g1(a[7], a[6], a[5], t1[0], t1[1]);
	 FA g2(a[4], a[3], a[2], t2[0], t2[1]);
	 
	 FA2 g3(t1, t2, a[1], t3[1:0], t3[2]);
	 FA3 g4(3'b000, t3, a[0], s[2:0], s[3]);
	 
endmodule