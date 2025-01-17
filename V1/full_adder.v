`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:53:31 08/14/2024 
// Design Name: 
// Module Name:    full_adder 
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
module full_adder(output s, output c, input a, input b, input c0);

	wire t1, t2, t3, t4, t5;
	
	xor g1(t1, a, b);
	xor g2(s, t1, c0); 
	
	and g3(t2, a, b);
	and g4(t3, b, c0);
	and g5(t4, c0, a);
	or g6(t5, t2, t3);
	or g7(c, t5, t4);

endmodule
