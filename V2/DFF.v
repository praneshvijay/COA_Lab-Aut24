`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 15:15:49
// Design Name: 
// Module Name: DFF
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


module DFF(
    input D,
    input CLK,
    input RST,
    output reg Q
    );
    
    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            Q <= 1'b0;
        end
        else begin
            Q <= D;
        end
    end
endmodule
