`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:39:09 09/10/2024
// Design Name:   RTST_A
// Module Name:   D:/FPGA/ALU/RTST_A_tb.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RTST_A
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RTST_A_tb;

	// Inputs
	reg [5:0] a;
	reg [5:0] b;

	// Outputs
	wire [5:0] s;

	// Instantiate the Unit Under Test (UUT)
	RTST_A uut (
		.a(a), 
		.b(b), 
		.s(s)
	);

	initial begin
		// Initialize Inputs
		a = 32;
		b = 3;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

