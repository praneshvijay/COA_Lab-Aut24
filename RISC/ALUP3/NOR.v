`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:49:21 10/01/2024 
// Design Name: 
// Module Name:    NOR 
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
module NOR #(parameter N = 8)
(
    input [N-1:0] A,
    input [N-1:0] B,
    output [N-1:0] C
);
	 
	 genvar i;
	 generate
	     for(i = 0; i < N; i = i + 1) begin
		      nor G(C[i], A[i], B[i]);
		  end
	 endgenerate

endmodule
