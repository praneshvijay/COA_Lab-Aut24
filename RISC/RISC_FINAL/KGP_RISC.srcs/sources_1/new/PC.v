`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 03:54:08
// Design Name: 
// Module Name: PC
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


module PC(
    input [31:0] PCin,
    input updatePC,
    input reset,
    input clk,
    output reg [31:0] PCout
);

    always @(posedge clk)
    begin
        if(reset) begin
            PCout <= 0;
        end
        else if (updatePC) begin
            PCout <= PCin;
        end
    end
endmodule
