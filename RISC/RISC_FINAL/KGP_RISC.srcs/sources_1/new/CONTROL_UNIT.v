`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 23:31:55
// Design Name: 
// Module Name: CONTROL_UNIT
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


module CONTROL_UNIT(
    input clk,
    input init,
    input [5:0] OPCODE,
    output reg [2:0] BranchOp,
    output reg [4:0] ALUOp,
    output reg ALUSrc, MemRead, MemWrite, RegWrite, DestReg, UpdatePC, MemtoReg
    );
    
    reg [2:0] cstate = 0;
    reg [4:0] state = 0;
    
    parameter
        R_TYPE = 6'b000000,

        ADDI =  6'b000001,
        SUBI =  6'b000010,
        ANDI =  6'b000011,
        ORI =   6'b000100,
        XORI = 6'b000101,
        NORI = 6'b000110,
        NOTI = 6'b000111,
        SLI = 6'b001000,
        SRLI = 6'b001001,
        SRAI = 6'b001010,
        SLTI = 6'b001011,
        SGTI = 6'b001100,
        HAMI = 6'b001101,
        LUI = 6'b010001,
        
        LD = 6'b010010,
        ST = 6'b010011,

        BR =   6'b010100,
        BMI =  6'b010101,
        BPL =  6'b010110,
        BZ =   6'b010111,

        MOVE = 6'b011000,

        HALT = 6'b011001,
        NOP = 6'b011010;
        
       
     always @(posedge clk) begin
        case(cstate)
            0: begin
                UpdatePC <= 0;
                cstate <= 1;
            end
            1: begin
                case(OPCODE)
                    // R-type
                    R_TYPE: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= 5'b0000;
                                ALUSrc <= 0;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 1;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                RegWrite <= 1;
                                state <= 2;
                            end
                            2: begin
                                RegWrite <= 0;
                                UpdatePC <= 1;
                                //state <= 0;
                                //cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    // I-type
                    ADDI: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= OPCODE;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                RegWrite <= 1;
                                state <= 2;
                            end
                            2: begin
                                RegWrite <= 0;
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    SUBI: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= OPCODE;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                RegWrite <= 1;
                                state <= 2;
                            end
                            2: begin
                                RegWrite <= 0;
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    ANDI: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= OPCODE;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                RegWrite <= 1;
                                state <= 2;
                            end
                            2: begin
                                RegWrite <= 0;
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    ORI: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= OPCODE;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                RegWrite <= 1;
                                state <= 2;
                            end
                            2: begin
                                RegWrite <= 0;
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    XORI: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= OPCODE;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                RegWrite <= 1;
                                state <= 2;
                            end
                            2: begin
                                RegWrite <= 0;
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    NORI: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= OPCODE;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                RegWrite <= 1;
                                state <= 2;
                            end
                            2: begin
                                RegWrite <= 0;
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    NOTI: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= OPCODE;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                RegWrite <= 1;
                                state <= 2;
                            end
                            2: begin
                                RegWrite <= 0;
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    SLI: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= OPCODE;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                RegWrite <= 1;
                                state <= 2;
                            end
                            2: begin
                                RegWrite <= 0;
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    SRLI: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= OPCODE;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                RegWrite <= 1;
                                state <= 2;
                            end
                            2: begin
                                RegWrite <= 0;
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    SRAI: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= OPCODE;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                RegWrite <= 1;
                                state <= 2;
                            end
                            2: begin
                                RegWrite <= 0;
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    SLTI: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= OPCODE;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                RegWrite <= 1;
                                state <= 2;
                            end
                            2: begin
                                RegWrite <= 0;
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    SGTI: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= OPCODE;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                RegWrite <= 1;
                                state <= 2;
                            end
                            2: begin
                                RegWrite <= 0;
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    HAMI: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= OPCODE;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                RegWrite <= 1;
                                state <= 2;
                            end
                            2: begin
                                RegWrite <= 0;
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    LUI: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= OPCODE;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                RegWrite <= 1;
                                state <= 2;
                            end
                            2: begin
                                RegWrite <= 0;
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    BR: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b100;
                                ALUOp <= 5'b00001;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                state <= 2;
                            end
                            2: begin
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    BMI: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b101;
                                ALUOp <= 5'b00001;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                state <= 2;
                            end
                            2: begin
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    BPL: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b110;
                                ALUOp <= 5'b00001;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                state <= 2;
                            end
                            2: begin
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    BZ: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b111;
                                ALUOp <= 5'b00001;
                                ALUSrc <= 1;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                DestReg <= 0;
                                MemtoReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                state <= 2;
                            end
                            2: begin
                                UpdatePC <= 1;
//                                state <= 0;
//                                cstate <= 0;
                                state <= 3;
                            end
                            3: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    LD: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= 5'b00001;
                                ALUSrc <= 1;
                                DestReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                MemRead <= 1;
                                MemWrite <= 0;
                                state <= 2;
                            end
                            2: begin
                                MemRead <= 0;
                                MemtoReg <= 1;
                                RegWrite <= 1;
                                state <= 3;
                            end
                            3: begin
                                MemtoReg <= 0;
                                RegWrite <= 0;
                                UpdatePC <= 1;
                                //cstate <= 0;
                                //state <= 0;
                                state <= 4;
                            end
                            4: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    ST: begin
                        case(state)
                            0: begin
                                BranchOp <= 3'b000;
                                ALUOp <= 5'b00001;
                                ALUSrc <= 1;
                                DestReg <= 0;
                                state <= 1;
                            end
                            1: begin
                                state <= 2;
                            end
                            2: begin
                                MemWrite <= 1;
                                state <= 3;
                            end
                            3: begin
                                MemWrite <= 0;
                                UpdatePC <= 1;
                                //state <= 0;
                                //cstate <= 0;
                                state <= 4;
                            end
                            4: begin
                                UpdatePC <= 0;
                                cstate <= 0;
                                state <= 0;
                            end
                        endcase
                    end
                    
                    MOVE: begin
                        BranchOp <= 3'b000;
                        ALUOp <= 4'b0001;
                        ALUSrc <= 1;
                        MemRead <= 0;
                        MemWrite <= 0;
                        RegWrite <= 1;
                        MemtoReg <= 0;
                        DestReg <= 0;
                        UpdatePC <= 1;
                        cstate <= 0;
                    end
                    
                    // HALT 
                    HALT: begin
                        case(state)
                            0: begin 
                                BranchOp <= 3'b000;
                                ALUOp <= 4'b0000;
                                ALUSrc <= 0;
                                MemRead <= 0;
                                MemWrite <= 0;
                                RegWrite <= 0;
                                MemtoReg <= 0;
                                DestReg <= 0; 
        
                                if (init) state <= 1; 
                            end
                            1: begin 
                                UpdatePC <= 1;
                                state <= 0;
                                cstate <= 0;
                            end
                        endcase
                    end
        
                    // NOP
                    default: begin
                        BranchOp <= 3'b000;
                        ALUOp <= 4'b0000;
                        ALUSrc <= 0;
                        MemRead <= 0;
                        MemWrite <= 0;
                        RegWrite <= 0;
                        MemtoReg <= 0;
                        DestReg <= 0;
                    end

                    
                endcase
            end
        endcase
     end
//     always @(posedge clk) begin
//     $display("cstate = %d | state = %d", cstate, state);
//     end

endmodule
