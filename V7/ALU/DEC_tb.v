`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:10:51 09/10/2024
// Design Name:   DEC
// Module Name:   D:/FPGA/ALU/DEC_tb.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DEC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DEC_tb;

	// Inputs
	reg [7:0] A;

	// Outputs
	wire [7:0] C;

	// Instantiate the Unit Under Test (UUT)
	DEC uut (
		.A(A), 
		.C(C)
	);

	initial begin
		// Initialize Inputs
		A = 10;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

