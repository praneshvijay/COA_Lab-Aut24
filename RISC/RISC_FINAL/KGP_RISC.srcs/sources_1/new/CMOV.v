`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 02:24:35
// Design Name: 
// Module Name: CMOV
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


module CMOV #(parameter N = 32)(
    input [N-1:0] A,
    input [N-1:0] B,
    output [N-1:0] C
    );
    
    wire sel;
    SLT #(N) G(A, B, sel);
    assign C = sel ? A : B;
endmodule
