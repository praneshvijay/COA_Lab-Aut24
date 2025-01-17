`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 23:23:09
// Design Name: 
// Module Name: INSTR_MEMORY
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


module INSTR_MEMORY(
        input clk,
        input [10:0] addra,
        output [31:0] douta
    );
    
    instr_memory instr_mem_inst(
      .clka(clk),  
      .addra(addra),
      .douta(douta)  
    );
endmodule
