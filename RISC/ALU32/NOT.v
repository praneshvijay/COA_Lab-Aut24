`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:49:46 09/04/2024 
// Design Name: 
// Module Name:    NOT 
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
module NOT #(parameter N = 8)
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
