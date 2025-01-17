`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 01:55:25
// Design Name: 
// Module Name: NOT
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


module NOT #(parameter N = 32)
(
    input [N-1:0] A,
    output [N-1:0] C
);
	 
	 genvar i;
	 generate
	     for(i = 0; i < N; i = i + 1) begin
		      not G(C[i], A[i]);
		  end
	 endgenerate

endmodule

