`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:47:19 09/10/2024 
// Design Name: 
// Module Name:    FA2 
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
module FA2(
    input [1:0] a,
    input [1:0] b,
    input c_in,
    output [1:0] s,
    output c_out
    );
	 wire t1;
	 FA g1(a[0], b[0], c_in, s[0], t1);
	 FA g2(a[1], b[1], t1, s[1], c_out);

endmodule