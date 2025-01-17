`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:24:21 09/11/2024 
// Design Name: 
// Module Name:    DECODE 
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
module DECODE(
    input [2:0] C,
    input EN,
    input clk,
    output reg [2:0] SRC_REG1,
    output reg [2:0] SRC_REG2,
    output reg [3:0] CMD,
    output reg [2:0] DEST_REG
    );
	 always @(posedge clk) begin
		if(EN) begin
			case (C)
					3'b000: begin
						 SRC_REG1 = 3'b010;
						 SRC_REG2 = 3'b011;
						 CMD = 4'b0000;
						 DEST_REG = 3'b001;
					end
					3'b001: begin
						 SRC_REG1 = 3'b001;
						 SRC_REG2 = 3'b101;
						 CMD = 4'b0001;
						 DEST_REG = 3'b100;
					end
					3'b010: begin
						 SRC_REG1 = 3'b001;
						 SRC_REG2 = 3'b010;
						 CMD = 4'b1010;
						 DEST_REG = 3'b010;
					end
					3'b011: begin
						 SRC_REG1 = 3'b001;
						 SRC_REG2 = 3'b010;
						 CMD = 4'b1011;
						 DEST_REG = 3'b111;
					end
					3'b100: begin
						 SRC_REG1 = 3'b001;
						 SRC_REG2 = 3'b010;
						 CMD = 4'b0010;
						 DEST_REG = 3'b110;
					end
					3'b101: begin
						 SRC_REG1 = 3'b001;
						 SRC_REG2 = 3'b010;
						 CMD = 4'b0100;
						 DEST_REG = 3'b001;
					end
					3'b110: begin
						 SRC_REG1 = 3'b010;
						 SRC_REG2 = 3'b000;
						 CMD = 4'b1000;
						 DEST_REG = 3'b011;
					end
					3'b111: begin
						 SRC_REG1 = 3'b000;
						 SRC_REG2 = 3'b000;
						 CMD = 4'b1000;
						 DEST_REG = 3'b110;
					end				
			  endcase
		end
	end

endmodule
