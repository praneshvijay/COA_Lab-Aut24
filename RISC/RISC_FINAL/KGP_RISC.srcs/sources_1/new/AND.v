`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 01:55:25
// Design Name: 
// Module Name: AND
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AND #(parameter N = 32)
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

