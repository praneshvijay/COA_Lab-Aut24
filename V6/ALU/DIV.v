`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:00 09/10/2024 
// Design Name: 
// Module Name:    DIV 
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
module DIV #(parameter N = 8)
(
    input [N-1:0] A,
    input [N-1:0] B,
    output [N-1:0] C
    );
	 
	 assign C = A / B;

endmodule
