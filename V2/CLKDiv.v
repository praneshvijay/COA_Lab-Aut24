`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 15:15:50
// Design Name: 
// Module Name: CLKDiv
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


module CLKDiv(
    input wire CLK_IN,
    input wire RST,
    output reg CLK_OUT
    );
    
    reg [31:0] counter;
    parameter divisor = 50_000_000;
    
    always @(posedge CLK_IN or posedge RST) begin 
        if (RST) begin
            counter <= 32'b0;
            CLK_OUT <= 1'b0;
        end else if (counter == divisor) begin
            counter <= 32'b0;
            CLK_OUT <= ~CLK_OUT;
        end else begin
            counter <= counter + 1;
        end 
    end
  
endmodule
