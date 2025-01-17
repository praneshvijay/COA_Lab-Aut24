`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:48:04 09/10/2024 
// Design Name: 
// Module Name:    FA3 
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
module FA3(
    input [2:0] a,
    input [2:0] b,
    input cin,
    output [2:0] s,
	 output c_out
    );
	
	FA g1(a[0], b[0], cin, s[0], t1);
	FA g2(a[1], b[1], t1, s[1], t2);
	FA g3(a[2], b[2], t2, s[2], c_out);

endmodule
