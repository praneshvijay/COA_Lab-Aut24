`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 02:47:03
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] A,
    input [31:0] B,
    input [4:0] SHAMT,
    input [5:0] FUNCT,
    input clk,
    output reg [31:0] ALU_OUT
    );
    
    parameter
        add = 1,
        sub = 2,
        and_code = 3,
        or_code = 4,
        xor_code = 5,
        nor_code = 6,
        not_code = 7,
        sl = 8,
        srl = 9,
        sra = 10,
        slt = 11,
        sgt = 12,
        ham = 13,
        inc = 14,
        dec = 15,
        cmov = 16;
    
    wire [31:0] ADD_OUT, SUB_OUT, AND_OUT, OR_OUT, XOR_OUT, NOR_OUT, NOT_OUT, SL_OUT, SRL_OUT, SRA_OUT, INC_OUT, DEC_OUT, SLT_OUT, SGT_OUT, LUI_OUT, HAM_OUT, CMOV_OUT;
    
     ADD G0(A, B, ADD_OUT);
	 SUB G1(A, B, SUB_OUT);
	 AND G2(A, B, AND_OUT);
	 OR  G3(A, B, OR_OUT);
	 XOR G4(A, B, XOR_OUT);
	 NOR G5(A, B, NOR_OUT);
	 NOT G6(A, NOT_OUT);
     SL G7(A, B, SL_OUT);
	 SRL G8(A, B, SRL_OUT);
	 SRA G9(A, B, SRA_OUT);
	 INC G10(A, INC_OUT);
	 DEC G11(A, DEC_OUT);
	 SLT G12(A, B, SLT_OUT);
	 SGT G13(A, B, SGT_OUT);
	 LUI G14(A, LUI_OUT);
	 HAM G15(A, HAM_OUT);
	 CMOV G16(A, B, CMOV_OUT);
	 
     always @(posedge clk)
     begin
        case(FUNCT)
            0: ALU_OUT <= ALU_OUT;
            add: ALU_OUT <= ADD_OUT;
            sub: ALU_OUT <= SUB_OUT;
            and_code: ALU_OUT <= AND_OUT;
            or_code: ALU_OUT <= OR_OUT;
            xor_code: ALU_OUT <= XOR_OUT;
            nor_code: ALU_OUT <= NOR_OUT;
            not_code: ALU_OUT <= NOT_OUT;
            sl: ALU_OUT <= SL_OUT;
            srl: ALU_OUT <= SRL_OUT;
            sra: ALU_OUT <= SRA_OUT;
            inc: ALU_OUT <= INC_OUT;
            dec: ALU_OUT <= DEC_OUT;
            slt: ALU_OUT <= SLT_OUT;
            sgt: ALU_OUT <= SGT_OUT;
            ham: ALU_OUT <= HAM_OUT;
            cmov: ALU_OUT <= CMOV_OUT;
            default: ALU_OUT <= ALU_OUT;
        endcase
     end

endmodule
