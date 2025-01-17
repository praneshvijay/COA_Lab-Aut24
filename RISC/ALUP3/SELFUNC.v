`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:38:20 09/10/2024 
// Design Name: 
// Module Name:    SELFUNC 
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
module SELFUNC #(parameter N = 8)(
    input [N-1:0] F0,
    input [N-1:0] F1,
    input [N-1:0] F2,
    input [N-1:0] F3,
    input [N-1:0] F4,
    input [N-1:0] F5,
    input [N-1:0] F6,
    input [N-1:0] F7,
    input [N-1:0] F8,
    input [N-1:0] F9,
    input [N-1:0] F10,
    input [N-1:0] F11,
    input [N-1:0] F12,
    input [N-1:0] F13,
    input [N-1:0] F14,
    input [N-1:0] F15,
    input [3:0] SEL,
    output [N-1:0] Z
    );
	 
	 genvar i;
	 generate
	     for(i = 0; i < N; i = i + 1) begin
		      MUX161 M({F15[i], F14[i], F13[i], F12[i], F11[i], F10[i], F9[i], F8[i], F7[i], F6[i], F5[i], F4[i], F3[i], F2[i], F1[i], F0[i]}, SEL, Z[i]);
		  end
	 endgenerate
	 
endmodule
