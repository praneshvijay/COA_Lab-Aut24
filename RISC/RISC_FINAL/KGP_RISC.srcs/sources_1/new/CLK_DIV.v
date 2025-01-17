`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 01:46:50
// Design Name: 
// Module Name: CLK_DIV
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


module CLK_DIV(
        input clk_in,
        output reg clk_out
    );
    
    reg[2:0] counter = 0;
    parameter DIVISOR = 4; 
    
    always @(posedge clk_in)
    begin
     counter <= counter + 1;
     if(counter >= (DIVISOR-1)) counter <= 0;
     clk_out <= (counter<DIVISOR/2)?1'b1:1'b0;
    end

endmodule
