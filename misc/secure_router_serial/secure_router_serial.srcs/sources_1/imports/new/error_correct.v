`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2024 22:03:09
// Design Name: 
// Module Name: error_correct
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


module error_correct(
    input clk,
    input rst,
    input error_inject_en,
    input data_in,  
    output wire [3:0] data_out 
);

reg[6:0] data_in_reg;

always@(posedge clk)
    begin
        if(rst)
            begin
                data_in_reg<=7'd0;
            end
        else if(error_inject_en==1'd1)
            begin
                data_in_reg[6:1]<=data_in_reg[5:0];
                data_in_reg[0]<=data_in;
            end
        else
            begin
                data_in_reg<=data_in_reg;
            end 
    end

    wire c1, c2, c3;
    

    wire b1 = data_in_reg[0];
    wire b2 = data_in_reg[1];
    wire b3 = data_in_reg[2];
    wire b4 = data_in_reg[3];
    wire b5 = data_in_reg[4];
    wire b6 = data_in_reg[5];
    wire b7 = data_in_reg[6];
    

    assign c1 = b1 ^ b3 ^ b5 ^ b7;
    assign c2 = b2 ^ b3 ^ b6 ^ b7;
    assign c3 = b4 ^ b5 ^ b6 ^ b7;
    
    
    wire [2:0] error_pos = {c3, c2, c1};
    
    reg [6:0] corrected_data;
    always @(*) begin
        case (error_pos)
            3'd1: corrected_data = {data_in_reg[6:1],~data_in_reg[0]};
            3'd2: corrected_data = {data_in_reg[6:2],~data_in_reg[1],data_in_reg[0]};
            3'd3: corrected_data = {data_in_reg[6:3],~data_in_reg[2],data_in_reg[1:0]};
            3'd4: corrected_data = {data_in_reg[6:4],~data_in_reg[3],data_in_reg[2:0]};
            3'd5: corrected_data = {data_in_reg[6:5],~data_in_reg[4],data_in_reg[3:0]};
            3'd6: corrected_data = {data_in_reg[6],~data_in_reg[5],data_in_reg[4:0]};
            3'd7: corrected_data = {~data_in_reg[6],data_in_reg[5:0]};
            default: corrected_data = data_in_reg; 
        endcase
    end
    
//    // Extract the 4-bit data from the corrected data
    assign data_out = {corrected_data[6], corrected_data[5], corrected_data[4], corrected_data[2]};

endmodule
