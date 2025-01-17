`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:13:53 08/27/2024
// Design Name:   error_inject
// Module Name:   D:/FPGA/A3/error_inject_tb.v
// Project Name:  A3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: error_inject
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module error_inject_tb;

	// Inputs
	reg [6:0] d_orig;
	reg [2:0] error_pos;

	// Outputs
	wire [6:0] d_error;

	// Instantiate the Unit Under Test (UUT)
	error_inject uut (
		.d_orig(d_orig), 
		.error_pos(error_pos), 
		.d_error(d_error)
	);

	initial begin
		// Initialize Inputs
		d_orig = 0;
		error_pos = 5;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

