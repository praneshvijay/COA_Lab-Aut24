`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 02:11:17
// Design Name: 
// Module Name: SRA_tb
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


module SRA_tb;

    // Test variables
    reg [31:0] A; // Input for the SRA module
    reg B;        // Select signal (shift control)
    wire [31:0] C; // Output from the SRA module

    // Instantiate the Unit Under Test (UUT)
    SRA uut (
        .A(A),
        .B(B),
        .C(C)
    );

    initial begin
        // Monitor the inputs and outputs
        $monitor("Time=%0t | A=%b | B=%b | C=%b", $time, A, B, C);

        // Test Case 1: Shift right by 1 (B=1)
        A = 32'b00000000000000000000000000001111; // 15 in decimal
        B = 1; // Shift right
        #10; // Expected C = 00000000000000000000000000000111 (7 in decimal)

        // Test Case 2: No Shift (B=0)
        A = 32'b00000000000000000000000000001111; // 15 in decimal
        B = 0; // No shift
        #10; // Expected C = 00000000000000000000000000001111 (15 in decimal)

        // Test Case 3: Shift right with a negative number
        A = 32'b11111111111111111111111111110000; // -16 in decimal
        B = 1; // Shift right
        #10; // Expected C = 11111111111111111111111111111000 (-8 in decimal)

        // Test Case 4: All bits set
        A = 32'b11111111111111111111111111111111; // -1 in decimal
        B = 1; // Shift right
        #10; // Expected C = 11111111111111111111111111111111 (-1 in decimal)

        // Test Case 5: Zero
        A = 32'b00000000000000000000000000000000; // 0 in decimal
        B = 1; // Shift right
        #10; // Expected C = 00000000000000000000000000000000 (0 in decimal)

        // Test Case 6: Shift by 1, then test the most significant bit
        A = 32'b10000000000000000000000000000001; // -2147483647 in decimal
        B = 1; // Shift right
        #10; // Expected C = 11000000000000000000000000000000 (-1073741824 in decimal)

        
    end

endmodule
