`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 01:50:47
// Design Name: 
// Module Name: ADD
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


module ADD #(parameter N = 32)
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

