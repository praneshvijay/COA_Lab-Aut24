`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:15 09/11/2024 
// Design Name: 
// Module Name:    REG_ALU 
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
module REG_ALU
(
    input clk,
    input [2:0] C,
	 input EN,
	 input rst,
    output [31:0] ALU_OUT
);
    wire [2:0] SRC_REG1, SRC_REG2, DEST_REG;
    wire [3:0] CMD;
    wire [31:0] REG1_DATA, REG2_DATA;
	 reg [31:0] WRT_DATA;
	 
    REG_BANK reg_bank(clk, rst, SRC_REG1, SRC_REG2, DEST_REG, WRT_DATA, EN, REG1_DATA, REG2_DATA);

    K_ALU k_alu(REG1_DATA, REG2_DATA, CMD, ALU_OUT);
	 
	 DECODE dec(C, EN, clk, SRC_REG1, SRC_REG2, CMD, DEST_REG); 
	 
	 always @(ALU_OUT) WRT_DATA <= ALU_OUT;
	 
endmodule

