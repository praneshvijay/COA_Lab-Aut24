`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 22:37:33
// Design Name: 
// Module Name: PC_CONTROL
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


module PC_CONTROL(
    input [2:0] BranchOp,
    input [31:0] ALUout,
    input [31:0] regval,
    input [31:0] PCin,
    input clk,
    input rst,
    output reg [31:0] PCout
    );
    
    always @(posedge clk) begin
        if(rst) PCout <= 0;
        else begin
            case(BranchOp)
                // BR 
                3'b100: PCout <= ALUout;
                // BMI
                3'b101: begin
                    if(regval<0) PCout <= ALUout;
                    else PCout <= PCin + 1;
                end
                // BPL
                3'b110: begin
                    if(regval>0)  PCout <= ALUout;
                    else PCout <= PCin + 1;
                end
                // BZ
                3'b111: begin
                    if(regval == 0) PCout <= ALUout;
                    else PCout <= PCin + 1;
                end
                default: PCout <= PCin + 1;
            endcase
        end
    end
endmodule
