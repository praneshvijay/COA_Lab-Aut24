`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:04:08 09/04/2024
// Design Name:   FA
// Module Name:   D:/FPGA/ALU/FA_tb.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

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
		// Initialize Inputs
		A = 1;
		B = 1;
		CIN = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

