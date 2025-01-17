`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:10:26 09/10/2024 
// Design Name: 
// Module Name:    DEC 
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
module DEC #(parameter N = 8)
(
    input [N-1:0] A,
    output [N-1:0] C
);

	 SUB #(.N(N)) G(A, 'd4, C);

endmodule
