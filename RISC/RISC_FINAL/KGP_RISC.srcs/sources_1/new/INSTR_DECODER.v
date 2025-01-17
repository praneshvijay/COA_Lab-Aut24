`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 16:04:24
// Design Name: 
// Module Name: INSTR_DECODER
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


module INSTR_DECODER(
        input [31:0] INSTR,
        output reg [5:0] OPCODE,
        output reg [5:0] FUNCT,
        output reg [4:0] Rs,
        output reg [4:0] Rt,
        output reg [4:0] Rd,
        output reg [4:0] SHAMT,
        output reg [31:0] IMM
    );
    
    always @(*) begin
        OPCODE <= INSTR[31:26];
        case(OPCODE)
            //R-type instructions
            6'b000000: begin
                Rs <= INSTR[25:21];
                Rt <= INSTR[20:16];
                Rd <= INSTR[15:11];
                SHAMT <= INSTR[10:6];
                FUNCT <= INSTR[5:0];
            end
            
            //HALT
            6'b011001: begin
                Rs <= 0;
                Rt <= 0;
                Rd <= 0;
                SHAMT <= 0;
                FUNCT <= 0;
                IMM <= 0;
            end
            
            //NOP
            6'b011010: begin
                Rs <= 0;
                Rt <= 0;
                Rd <= 0;
                SHAMT <= 0;
                FUNCT <= 0;
                IMM <= 0;
            end
            
            //I-type
            default: begin
                Rs <= INSTR[25:21];
                Rt <= INSTR[20:16];
                Rd <= 0;
                SHAMT <= 0;
                FUNCT <= 0;
                if(OPCODE == 6'b011000) IMM <= 0;
                else IMM <= {{16{INSTR[15]}}, INSTR[15:0]};
            end
        endcase
    end
endmodule
