`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2024 14:53:45
// Design Name: 
// Module Name: RISC_tb
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


module RISC_tb;

    reg clk, rst, init;
    wire [15:0] out;
    
    RISC uut (
                .clk(clk),
                .rst(rst),
                .init(init),
                .out(out)
    );
    
    initial clk = 1'b0;
    
    always #5 clk = ~clk;
    
    initial begin
        rst = 1'b1;
        init = 1'b0;
        
        #10;
        
        rst = 1'b0;
        
    end
endmodule
