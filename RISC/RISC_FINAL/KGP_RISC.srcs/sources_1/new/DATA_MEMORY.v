`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 22:59:57
// Design Name: 
// Module Name: DATA_MEMORY
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


module DATA_MEMORY(
        input clk,
        input ena,
        input wea,
        input [10:0] addra,
        input [31:0] dina,
        output [31:0] douta
    );
    
  data_memory data_mem_inst (
  .clka(clk),  
  .ena(ena), 
  .wea(wea),      
  .addra(addra), 
  .dina(dina),    
  .douta(douta)
);
endmodule
