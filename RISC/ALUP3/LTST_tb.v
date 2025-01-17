`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:18:55 09/10/2024
// Design Name:   LTST
// Module Name:   D:/FPGA/ALU/LTST_tb.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LTST
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LTST_tb;

	// Inputs
	reg [5:0] a;
	reg [5:0] b;

	// Outputs
	wire [5:0] C;

	// Instantiate the Unit Under Test (UUT)
	LTST uut (
		.a(a), 
		.b(b), 
		.C(C)
	);

	initial begin
		// Initialize Inputs
		a = 3;
		b = 2;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

