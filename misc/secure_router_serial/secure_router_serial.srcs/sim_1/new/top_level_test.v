`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2024 05:23:16
// Design Name: 
// Module Name: top_level_test
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


module top_level_test;
// Testbench signals
    reg [5:0] d_in;
    reg [2:0] error_pos;
    reg clk;
    reg rst;
    wire [3:0] corrected_data0;
    wire [3:0] corrected_data1;
    wire [3:0] corrected_data2;
    wire [3:0] corrected_data3;

    // Instantiate the top_level module
    top_level top_level_inst (
        .clk(clk),
        .rst(rst),
        .d_in(d_in),
        .error_pos(error_pos),
        .corrected_data0(corrected_data0),
        .corrected_data1(corrected_data1),
        .corrected_data2(corrected_data2),
        .corrected_data3(corrected_data3)
    );
    
    initial
        begin
            clk<=1'd0;
            rst<=1'd1;
        end
    
    
    always #10 clk=~clk;
    
    // Testbench procedure
    initial begin
        // Apply test data
        // Test case 1: Port 0 with data 0000, error injected at position 2
        d_in = 6'b111011; // port 00, data 0000
        error_pos = 3'd2; // Error position
        #30 rst<=1'd0;
    end

endmodule
