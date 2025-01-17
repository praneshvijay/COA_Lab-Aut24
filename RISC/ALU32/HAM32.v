`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:16 10/01/2024 
// Design Name: 
// Module Name:    HAM32 
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
module HAM32(
    input [31:0] a,
    output [31:0] s
    );
	 
	 wire [3:0] t1, t2, t3, t5;
	 HAM8 g1(a[31:24], t1);
	 HAM8 g2(a[15:8], t2);
	 HAM8 g3(a[23:16], t3);
	 HAM8 g6(a[7:0], t5);
	 wire [5:0] t4, t6;
	 ADD #(6) g4({2'b0, t1}, {2'b0, t2}, t4);
	 ADD #(6) g5({2'b0, t3}, {2'b0, t5}, t6);
	 ADD #(6) g7(t4, t6, s[5:0]);
	 assign s[31:6] = 26'b0;

endmodule
