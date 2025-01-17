`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:06:49 09/10/2024 
// Design Name: 
// Module Name:    INC 
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
module INC #(parameter N = 8)
(
    input [N-1:0] A,
    output [N-1:0] C
);

	 ADD #(.N(N)) G(A, 'd4, C);

endmodule
