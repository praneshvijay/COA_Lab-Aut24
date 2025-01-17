`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 02:30:21
// Design Name: 
// Module Name: CMOV_tb
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



module CMOV_tb;

    // Test variables
    reg [31:0] A; // Input for the CMOV module
    reg [31:0] B; // Input for the CMOV module
    wire [31:0] C; // Output from the CMOV module

    // Instantiate the Unit Under Test (UUT)
    CMOV #(32) uut (
        .A(A),
        .B(B),
        .C(C)
    );

    initial begin
        // Monitor the inputs and outputs
        $monitor("Time=%0t | A=%b | B=%b | C=%b", $time, A, B, C);

        // Test Case 1: A < B
        A = 32'b00000000000000000000000000000001; // 1
        B = 32'b00000000000000000000000000000010; // 2
        #10; // Expected C = A (1) since A < B

        // Test Case 2: A > B
        A = 32'b00000000000000000000000000000100; // 4
        B = 32'b00000000000000000000000000000011; // 3
        #10; // Expected C = B (3) since A > B

        // Test Case 3: A == B
        A = 32'b00000000000000000000000000000010; // 2
        B = 32'b00000000000000000000000000000010; // 2
        #10; // Expected C = B (2) since A == B (C should take B)

        // Test Case 4: A is negative, B is positive
        A = 32'b11111111111111111111111111111110; // -2
        B = 32'b00000000000000000000000000000001; // 1
        #10; // Expected C = B (1) since A < B (negative is less than positive)

        // Test Case 5: A is positive, B is negative
        A = 32'b00000000000000000000000000000001; // 1
        B = 32'b11111111111111111111111111111110; // -2
        #10; // Expected C = B (-2) since A > B (positive is greater than negative)

        // Test Case 6: Both are negative, B < A
        A = 32'b11111111111111111111111111111100; // -4
        B = 32'b11111111111111111111111111111000; // -8
        #10; // Expected C = B (-8) since A > B in signed comparison

    end

endmodule

