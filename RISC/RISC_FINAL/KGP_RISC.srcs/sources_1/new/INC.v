`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 02:00:52
// Design Name: 
// Module Name: INC
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


module INC #(parameter N = 32)
(
    input [N-1:0] A,
    output [N-1:0] C
);

	 ADD #(.N(N)) G(A, 'd4, C);

endmodule

