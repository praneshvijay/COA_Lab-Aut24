`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 03:24:44
// Design Name: 
// Module Name: ALU_CONTROL
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_CONTROL(
        input [31:0] A,
        input [31:0] NPC,
        input [31:0] B,
        input [31:0] IMM,
        input [2:0] BranchOp,
        input ALUSrc,
        output [31:0] ALUin1,
        output [31:0] ALUin2
    );
    
    assign ALUin1 = (BranchOp == 0) ? A : NPC;
    assign ALUin2 = (ALUSrc == 0) ? B : IMM;
endmodule
