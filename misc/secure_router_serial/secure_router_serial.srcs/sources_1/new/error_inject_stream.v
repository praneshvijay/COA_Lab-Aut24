`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2024 10:01:33
// Design Name: 
// Module Name: error_inject_stream
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


module error_inject_stream(
    input clk,
    input rst,
    input secure_router_en,
    input data_in,      
    input [2:0] error_pos,    
    output reg data_out,     
    output reg en
);

reg[6:0] data_in_reg;
wire input_done;
reg[2:0] count, count_in;
reg [6:0] data_out_reg;
reg [6:0] data_out_final;

always@(posedge clk)
    begin
        if(rst)
            begin
                data_out<=1'd0;
                count<=3'd0;
                en<=1'd0;
            end
        else if(secure_router_en==1'd1 && count<3'd7 && count==error_pos)
            begin
                data_out<=~data_in;
                count<=count+3'd1;
                en<=1'd1;              
            end
        else if(secure_router_en==1'd1 && count<3'd7 && count!=error_pos)
            begin
                data_out<=data_in;
                count<=count+3'd1;
                en<=1'd1;              
            end
        else
            begin
                data_out<=1'd0;
                count<=count;
                en<=1'd0;             
            end
    end

endmodule
