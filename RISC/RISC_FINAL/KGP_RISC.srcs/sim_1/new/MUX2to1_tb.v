`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 01:25:08
// Design Name: 
// Module Name: MUX2to1_tb
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


`timescale 1ns / 1ps

module MUX2to1_tb;

    // Inputs
    reg in0;
    reg in1;
    reg sel;

    // Output
    wire out;

    // Instantiate the Unit Under Test (UUT)
    MUX2to1 uut (
        .in0(in0),
        .in1(in1),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Monitor changes in inputs and output
        $monitor("Time=%0t | in0=%b | in1=%b | sel=%b | out=%b", $time, in0, in1, sel, out);

        // Test Case 1: sel = 0, in0 = 0, in1 = 0 -> out should be 0
        in0 = 0; in1 = 0; sel = 0;
        #10;

        // Test Case 2: sel = 0, in0 = 1, in1 = 0 -> out should be 1
        in0 = 1; in1 = 0; sel = 0;
        #10;

        // Test Case 3: sel = 0, in0 = 0, in1 = 1 -> out should be 0
        in0 = 0; in1 = 1; sel = 0;
        #10;

        // Test Case 4: sel = 0, in0 = 1, in1 = 1 -> out should be 1
        in0 = 1; in1 = 1; sel = 0;
        #10;

        // Test Case 5: sel = 1, in0 = 0, in1 = 0 -> out should be 0
        in0 = 0; in1 = 0; sel = 1;
        #10;

        // Test Case 6: sel = 1, in0 = 1, in1 = 0 -> out should be 0
        in0 = 1; in1 = 0; sel = 1;
        #10;

        // Test Case 7: sel = 1, in0 = 0, in1 = 1 -> out should be 1
        in0 = 0; in1 = 1; sel = 1;
        #10;

        // Test Case 8: sel = 1, in0 = 1, in1 = 1 -> out should be 1
        in0 = 1; in1 = 1; sel = 1;
        #10;
    end

endmodule

