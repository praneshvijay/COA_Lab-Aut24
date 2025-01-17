`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:23:56 09/10/2024 
// Design Name: 
// Module Name:    ADD 
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
module ADD #(parameter N = 8)
(
    input [N-1:0] A,
    input [N-1:0] B,
    output [N-1:0] S
);
	 
	 wire [N:0] C;
	 assign C[0] = 0;
	 
	 genvar i;
	 generate
	     for(i = 0; i < N; i = i + 1) begin
		      FA G(A[i], B[i], C[i], S[i], C[i+1]); 
		  end
	 endgenerate
	 
endmodule
