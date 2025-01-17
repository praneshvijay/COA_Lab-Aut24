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
    input [15:0] INS,
	 input btn,
	 input rst,
    output reg [15:0] OUT
);
    reg [3:0] SRC_REG1, SRC_REG2, DEST_REG;
	 reg [3:0] OP_CODE;
    wire [31:0] REG1_DATA, REG2_DATA;
	 wire [31:0] ALU_OUT;
	 
	 reg REG_RST, WRT_EN;
	 reg [3:0] STATE;
	 
    REG_BANK reg_bank(clk, rst, {{1'b0}, SRC_REG1}, {{1'b0}, SRC_REG2}, {{1'b0}, DEST_REG}, ALU_OUT, WRT_EN, REG1_DATA, REG2_DATA);

    K_ALU k_alu(REG1_DATA, REG2_DATA, OP_CODE, ALU_OUT);
	 
	 //wire pos;
	 //DET_POS det(clk, btn, pos);
	 
	 always @(posedge clk) begin
		//if(pos) begin
			case(STATE)
				0: begin
					OP_CODE <= INS[15:12];
					SRC_REG1 <= INS[11:8];
					SRC_REG2 <= INS[7:4];
					DEST_REG <= INS[3:0];
				end
				1: begin
					WRT_EN <= 1;
					OUT <= ALU_OUT[15:0];
				end
				2: begin
					WRT_EN <= 0;
					OUT <= ALU_OUT[31:16];
				end
			endcase
			
			if(btn) begin
				STATE <= (STATE + 1)%3;
			end
			
			if(rst) begin
				STATE <= 0;
				SRC_REG1 <= 0;
				SRC_REG2 <= 0;
				DEST_REG <= 0;
				OUT <= 0;
				WRT_EN <= 0;
			end
	end		
endmodule

