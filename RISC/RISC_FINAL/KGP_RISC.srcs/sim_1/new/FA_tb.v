`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 01:48:15
// Design Name: 
// Module Name: FA_tb
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


module FA_tb;

    // Inputs
    reg A;
    reg B;
    reg CIN;

    // Outputs
    wire S;
    wire COUT;

    // Instantiate the Unit Under Test (UUT)
    FA uut (
        .A(A),
        .B(B),
        .CIN(CIN),
        .S(S),
        .COUT(COUT)
    );

    initial begin
        // Monitor the inputs and outputs
        $monitor("Time=%0t | A=%b | B=%b | CIN=%b | S=%b | COUT=%b", $time, A, B, CIN, S, COUT);

        // Apply all combinations of inputs A, B, CIN
        // Expected outputs are provided as comments
        A = 0; B = 0; CIN = 0; #10; // Expected S = 0, COUT = 0
        A = 0; B = 0; CIN = 1; #10; // Expected S = 1, COUT = 0
        A = 0; B = 1; CIN = 0; #10; // Expected S = 1, COUT = 0
        A = 0; B = 1; CIN = 1; #10; // Expected S = 0, COUT = 1
        A = 1; B = 0; CIN = 0; #10; // Expected S = 1, COUT = 0
        A = 1; B = 0; CIN = 1; #10; // Expected S = 0, COUT = 1
        A = 1; B = 1; CIN = 0; #10; // Expected S = 0, COUT = 1
        A = 1; B = 1; CIN = 1; #10; // Expected S = 1, COUT = 1

    end

endmodule

