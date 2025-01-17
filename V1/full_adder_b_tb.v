`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:52:23 08/14/2024
// Design Name:   full_adder_b
// Module Name:   D:/FPGA/A2/full_adder_b_tb.v
// Project Name:  A2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_adder_b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module full_adder_b_tb;

	// Inputs
	reg a;
	reg b;
	reg c0;

	// Outputs
	wire s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	full_adder_b uut (
		.a(a), 
		.b(b), 
		.c0(c0), 
		.s(s), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		a = 1;
		b = 1;
		c0 = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

