`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:13 09/04/2024 
// Design Name: 
// Module Name:    AND 
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
module AND #(parameter N = 8)
(
    input [N-1:0] A,
    input [N-1:0] B,
    output [N-1:0] C
);
	 
	 genvar i;
	 generate
	     for(i = 0; i < N; i = i + 1) begin
		      and G(C[i], A[i], B[i]);
		  end
	 endgenerate

endmodule
