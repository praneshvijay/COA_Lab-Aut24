`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2024 00:10:07
// Design Name: 
// Module Name: RISC
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


module RISC(
        input clk,
        input rst,
        input init,
        output [15:0] out
    );
    
//    wire clk;
//    CLK_DIV G(clk1, clk);
    
    wire [31:0] PC, ins;
    
    INSTR_MEMORY instr_mem(
          .clk(clk),   
          .addra(PC[10:0]),   
          .douta(ins)  
    );
    
    wire MemRead, MemWrite;
    wire [31:0] addra, ALUout, LMD;
    
    DATA_MEMORY data_mem(
      .clk(clk),   
      .ena(MemRead),      
      .wea(MemWrite),      
      .addra(ALUout[10:0]), 
      .dina(b),    
      .douta(LMD)
    );
    
    wire [5:0] opcode, funct;
    wire [4:0] rs, rt, rd, shamt;
    wire [31:0] imm;
    
    INSTR_DECODER instr_dec(
        .INSTR(ins),
        .OPCODE(opcode),
        .FUNCT(funct),
        .Rs(rs),
        .Rt(rt),
        .Rd(rd),
        .SHAMT(shamt),
        .IMM(imm)
    );
    
    wire [2:0] BranchOp;
    wire [4:0] ALUop;
    wire ALUSrc, RegWrite, DestReg, UpdatePC, MemtoReg;
    
    CONTROL_UNIT cu(
        .clk(clk),
        .init(init),
        .OPCODE(opcode),
        .BranchOp(BranchOp),
        .ALUOp(ALUop),
        .ALUSrc(ALUSrc), 
        .MemRead(MemRead), 
        .MemWrite(MemWrite), 
        .RegWrite(RegWrite), 
        .DestReg(DestReg), 
        .UpdatePC(UpdatePC), 
        .MemtoReg(MemtoReg)
    );
    
    wire [5:0] destreg;
    wire [31:0] rdin;
    assign destreg = (DestReg == 1) ? rd : rt;
    assign rdin = (MemtoReg == 1) ? LMD : ALUout;
    wire [31:0] a, b, NPC;
    wire [31:0] output_data;
    
    REG_BANK regbank(
        .clk(clk),
	    .rst(rst),
        .SRC_REG1(rs),
        .SRC_REG2(rt),
        .DEST_REG(destreg),
        .WRT_DATA(rdin),
        .WRT_EN(RegWrite),
        .output_data(output_data),
        .REG1_DATA(a),
        .REG2_DATA(b)
    );
    
    PC_CONTROL pcc(
        .BranchOp(BranchOp),
        .ALUout(ALUout),
        .regval(a),
        .PCin(PC),
        .clk(clk),
        .rst(rst),
        .PCout(NPC)
    );
    
    PC pc1(
        .PCin(NPC),
        .updatePC(UpdatePC),
        .reset(rst),
        .clk(clk),
        .PCout(PC)
    );
    
    wire [5:0] alufunc;
    assign alufunc = (ALUop == 6'b0) ? funct : ALUop;
    
    wire [31:0] aluin1;
    assign aluin1 = (BranchOp == 0) ? a : PC;
    
    wire [31:0] aluin2;
    assign aluin2 = (ALUSrc == 0) ? b : imm;
    
    ALU alu0(
        .A(aluin1),
        .B(aluin2),
        .SHAMT(shamt),
        .FUNCT(alufunc),
        .clk(clk),
        .ALU_OUT(ALUout)
    );
    assign out = output_data[15:0];
    
//    always @(posedge clk) begin
//        $display("BranchOp = %b | ALUOp = %b | ALUSrc = %b | memread = %b | memwrite = %b | regwrite = %b | destreg = %b | memtoreg = %b | updatepc = %b",BranchOp, ALUop, ALUSrc, MemRead, MemWrite, RegWrite, DestReg, MemtoReg, UpdatePC);
//        $display("PC = %d | ins = %b | OPCODE = %b | funct = %b | rs = %b | rt = %b | rd = %b | shamt = %b | imm = %b", PC, ins, opcode, funct, rs, rt, rd, shamt, imm);
//        $display("LMD = %b | rdin = %b", LMD, rdin);
//        $display("a = %b | b = %b | aluin1 = %b | aluin2 = %b | aluout = %b  \n", a, b, aluin1, aluin2, ALUout);
//        $display("aluout = %d \n", ALUout);
//    end
endmodule
