`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 01:51:53
// Design Name: 
// Module Name: ADD_tb
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

module ADD_tb;

    // Parameter for bit-width of the adder
    parameter N = 8;

    // Inputs
    reg [N-1:0] A;
    reg [N-1:0] B;

    // Output
    wire [N-1:0] S;

    // Instantiate the Unit Under Test (UUT)
    ADD #(N) uut (
        .A(A),
        .B(B),
        .S(S)
    );

    initial begin
        // Monitor the inputs and output
        $monitor("Time=%0t | A=%b | B=%b | S=%b", $time, A, B, S);

        // Test Case 1: A = 0, B = 0
        A = 8'b00000000;
        B = 8'b00000000;
        #10; // Expected S = 00000000

        // Test Case 2: A = 1, B = 1
        A = 8'b00000001;
        B = 8'b00000001;
        #10; // Expected S = 00000010

        // Test Case 3: A = 255 (all 1s), B = 1
        A = 8'b11111111;
        B = 8'b00000001;
        #10; // Expected S = 00000000 (overflow with carry)

        // Test Case 4: A = 85 (1010101), B = 85 (1010101)
        A = 8'b01010101;
        B = 8'b01010101;
        #10; // Expected S = 10101010

        // Test Case 5: A = 128, B = 128 (highest bit set)
        A = 8'b10000000;
        B = 8'b10000000;
        #10; // Expected S = 00000000 (overflow with carry)

        // Test Case 6: Random pattern
        A = 8'b00110011;
        B = 8'b01010101;
        #10; // Expected S = 10001000

        
    end

endmodule
