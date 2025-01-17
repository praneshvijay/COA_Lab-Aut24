`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:35:55 09/10/2024 
// Design Name: 
// Module Name:    RTST_A 
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
module RTST_A(
    input [5:0] a,
    input [5:0] b,
    output [5:0] s
    );
	 
	 wire check;
	 wire [2:0] select;
	 wire [5:0] s1;
	 
	 assign select = b[2:0];
	 
	 or g1(check, b[5], b[4], b[3]);
	 
	 MUX81 m5({a[5], a[5], a[5], a[5], a[5], a[5], a[5], a[5]}, select, s1[5]);
	 MUX81 m4({a[5], a[5], a[5], a[5], a[5], a[5], a[5], a[4]}, select, s1[4]);
	 MUX81 m3({a[5], a[5], a[5], a[5], a[5], a[5], a[4], a[3]}, select, s1[3]);
	 MUX81 m2({a[5], a[5], a[5], a[5], a[5], a[4], a[3], a[2]}, select, s1[2]);
	 MUX81 m1({a[5], a[5], a[5], a[5], a[4], a[3], a[2], a[1]}, select, s1[1]);
	 MUX81 m0({a[5], a[5], a[5], a[4], a[3], a[2], a[1], a[0]}, select, s1[0]);
	 
	 MUX21 o5({a[5], s1[5]}, check, s[5]);
	 MUX21 o4({a[5], s1[4]}, check, s[4]);
	 MUX21 o3({a[5], s1[3]}, check, s[3]);
	 MUX21 o2({a[5], s1[2]}, check, s[2]);
	 MUX21 o1({a[5], s1[1]}, check, s[1]);
	 MUX21 o0({a[5], s1[0]}, check, s[0]);

endmodule
