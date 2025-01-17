`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 03:33:59
// Design Name: 
// Module Name: REG_BANK
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


module REG_BANK
(
    input clk,
	input rst,
    input [4:0]   SRC_REG1,
    input [4:0]   SRC_REG2,
    input [4:0]   DEST_REG,
    input [31:0]  WRT_DATA,
    input  WRT_EN,
    output [31:0] output_data,
    output [31:0] REG1_DATA,
    output [31:0] REG2_DATA
);

    reg [32:0] REG_FILE [0:16];
	
	assign REG1_DATA = REG_FILE[SRC_REG1];
	assign REG2_DATA = REG_FILE[SRC_REG2];
    assign output_data = REG_FILE[5];
    
    always @(posedge clk) begin
        REG_FILE[0] <= 32'd0;   
        if(rst) begin
            REG_FILE[1] <= 32'd10;    
            REG_FILE[2] <= 32'd20;    
            REG_FILE[3] <= 32'd1;    
            REG_FILE[4] <= 32'd40;    
            REG_FILE[5] <= 32'd0;    
            REG_FILE[6] <= 32'd60;    
            REG_FILE[7] <= 32'd70;    
            REG_FILE[8] <= 32'd80;    
            REG_FILE[9] <= 32'd90;    
            REG_FILE[10] <= 32'd100;  
            REG_FILE[11] <= 32'd110;  
            REG_FILE[12] <= 32'd120;  
            REG_FILE[13] <= 32'd130;  
            REG_FILE[14] <= 32'd140;  
            REG_FILE[15] <= 32'd150;  
            REG_FILE[16] <= 32'd1023;  
        end
        
        if (WRT_EN) begin
            REG_FILE[DEST_REG] <= WRT_DATA;
        end
    end


endmodule

