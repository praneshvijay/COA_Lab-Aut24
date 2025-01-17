`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 01:30:04
// Design Name: 
// Module Name: SL_tb
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

module SL_tb;

    // Inputs
    reg [31:0] A;
    reg B;

    // Output
    wire [31:0] C;

    // Instantiate the Unit Under Test (UUT)
    SL uut (
        .A(A),
        .B(B),
        .C(C)
    );

    initial begin
        // Monitor the values of inputs and output
        $monitor("Time=%0t | A=%b | B=%b | C=%b", $time, A, B, C);

        // Test Case 1: B = 0, no shift, output C should equal A
        A = 32'b00000000000000000000000000000001; // A = 1
        B = 0;
        #10; // Expected C = 00000000000000000000000000000001

        // Test Case 2: B = 1, left shift A by 1 bit, output C should be A << 1
        B = 1;
        #10; // Expected C = 00000000000000000000000000000010

        // Test Case 3: All bits set in A, B = 1, expect left shift by 1 bit
        A = 32'b11111111111111111111111111111111; // A = all 1s
        B = 1;
        #10; // Expected C = 11111111111111111111111111111110

        // Test Case 4: All bits set in A, B = 0, no shift
        B = 0;
        #10; // Expected C = 11111111111111111111111111111111

        // Test Case 5: Use a different pattern in A and shift it
        A = 32'b00010010001101000101011001111000; // A = 00010010001101000101011001111000
        B = 1;
        #10; // Expected C = 00100100011010001010110011110000

        // Test Case 6: Different pattern, no shift
        B = 0;
        #10; // Expected C = 00010010001101000101011001111000

        // Test Case 7: A with MSB set, left shift by 1 bit (B = 1)
        A = 32'b10000000000000000000000000000000; // A = MSB set
        B = 1;
        #10; // Expected C = 00000000000000000000000000000000

        // Test Case 8: A = 0, B = 1, left shift should still be 0
        A = 32'b00000000000000000000000000000000; // A = 0
        B = 1;
        #10; // Expected C = 00000000000000000000000000000000

    end

endmodule

