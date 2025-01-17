`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2024 04:33:19
// Design Name: 
// Module Name: top_level
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


module top_level(
    input clk,
    input rst,
    input [5:0] d_in,               
    input [2:0] error_pos,          
    output [3:0] corrected_data0,   
    output [3:0] corrected_data1,   
    output [3:0] corrected_data2,   
    output [3:0] corrected_data3    
);

    
    wire hamming_code0;     
    wire hamming_code1;     
    wire hamming_code2;     
    wire hamming_code3;     
    wire secure_router_en;
    wire error_inject_en_0;
    wire error_inject_en_1;
    wire error_inject_en_2;
    wire error_inject_en_3;
    wire errored_data0;     
    wire errored_data1;     
    wire errored_data2;     
    wire errored_data3;     

   
    secure_router secure_router_inst (
        .clk(clk),
        .rst(rst),
        .d_in(d_in),
        .en(secure_router_en),
        .out0(hamming_code0),
        .out1(hamming_code1),
        .out2(hamming_code2),
        .out3(hamming_code3)
    );

 
    error_inject_stream error_inject_inst0 (
        .clk(clk),
        .rst(rst),
        .secure_router_en(secure_router_en),
        .en(error_inject_en_0),
        .data_in(hamming_code0),
        .error_pos(error_pos),
        .data_out(errored_data0)
    );

    error_inject_stream error_inject_inst1 (
        .clk(clk),
        .rst(rst),
        .secure_router_en(secure_router_en),
        .en(error_inject_en_1),
        .data_in(hamming_code1),
        .error_pos(error_pos),
        .data_out(errored_data1)
    );

    error_inject_stream error_inject_inst2 (
        .clk(clk),
        .rst(rst),
        .secure_router_en(secure_router_en),
        .en(error_inject_en_2),
        .data_in(hamming_code2),
        .error_pos(error_pos),
        .data_out(errored_data2)
    );

    error_inject_stream error_inject_inst3 (
        .clk(clk),
        .rst(rst),
        .secure_router_en(secure_router_en),
        .en(error_inject_en_3),
        .data_in(hamming_code3),
        .error_pos(error_pos),
        .data_out(errored_data3)
    );

    
    error_correct error_correct_inst0 (
        .clk(clk),
        .rst(rst),
        .error_inject_en(error_inject_en_0),
        .data_in(errored_data0),
        .data_out(corrected_data0)
    );

    error_correct error_correct_inst1 (
        .clk(clk),
        .rst(rst),
        .error_inject_en(error_inject_en_1),
        .data_in(errored_data1),
        .data_out(corrected_data1)
    );

    error_correct error_correct_inst2 (
        .clk(clk),
        .rst(rst),
        .error_inject_en(error_inject_en_2),
        .data_in(errored_data2),
        .data_out(corrected_data2)
    );

    error_correct error_correct_inst3 (
        .clk(clk),
        .rst(rst),
        .error_inject_en(error_inject_en_3),
        .data_in(errored_data3),
        .data_out(corrected_data3)
    );

endmodule
