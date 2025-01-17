`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.09.2024 22:02:02
// Design Name: 
// Module Name: secure_router
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


module secure_router(
    input clk,
    input rst,
    input wire [5:0] d_in,      
    output reg out0,     
    output reg out1,     
    output reg out2,    
    output reg out3,    
    output reg en
);
    wire[6:0] data_out0,data_out1,data_out2,data_out3;

    wire [1:0] port = d_in[5:4];
    wire [3:0] data = d_in[3:0];


    wire d1 = data[0];
    wire d2 = data[1];
    wire d3 = data[2];
    wire d4 = data[3];

    wire p1 = d1 ^ d2 ^ d4;
    wire p2 = d1 ^ d3 ^ d4;
    wire p3 = d2 ^ d3 ^ d4;


    wire [6:0] hamming_code = {d4, d3, d2, p3, d1, p2, p1};


    assign data_out0 = (port == 2'b00) ? hamming_code : 7'b0;
    assign data_out1 = (port == 2'b01) ? hamming_code : 7'b0;
    assign data_out2 = (port == 2'b10) ? hamming_code : 7'b0;
    assign data_out3 = (port == 2'b11) ? hamming_code : 7'b0;
    
    reg[6:0] data_in_reg_0,data_in_reg_1,data_in_reg_2,data_in_reg_3;
    reg[2:0] count;

always@(posedge clk)
    begin
        if(rst)
            begin
                data_in_reg_0<=data_out0;
                data_in_reg_1<=data_out1;
                data_in_reg_2<=data_out2;
                data_in_reg_3<=data_out3;
                out0<=1'd0;
                out1<=1'd0;
                out2<=1'd0;
                out3<=1'd0;
                en<=1'd0;
                count<=3'd0;
            end        
        else if(count<3'd7)
            begin
                data_in_reg_0[6:1]<=data_in_reg_0[5:0];
                out0<=data_in_reg_0[6];
                data_in_reg_1[6:1]<=data_in_reg_1[5:0];
                out1<=data_in_reg_1[6];
                data_in_reg_2[6:1]<=data_in_reg_2[5:0];
                out2<=data_in_reg_2[6];
                data_in_reg_3[6:1]<=data_in_reg_3[5:0];
                out3<=data_in_reg_3[6];
                en<=1'd1;
                count<=count+3'd1;
            end
        else
            begin
                data_in_reg_0<=data_in_reg_0;
                out0<=1'd0;
                data_in_reg_1<=data_in_reg_1;
                out1<=1'd0;
                data_in_reg_2<=data_in_reg_2;
                out2<=1'd0;
                data_in_reg_3<=data_in_reg_3;
                out3<=1'd0;
                en<=1'd0;
                count<=count;
            end
    end
    
endmodule
