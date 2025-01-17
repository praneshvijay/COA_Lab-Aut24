`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:48:39 08/27/2024
// Design Name:   error_correct
// Module Name:   D:/FPGA/A3/error_correct_tb.v
// Project Name:  A3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: error_correct
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module error_correct_tb;

	// Inputs
	reg [6:0] d_hamm;

	// Outputs
	wire [3:0] d_disp;

	// Instantiate the Unit Under Test (UUT)
	error_correct uut (
		.d_hamm(d_hamm), 
		.d_disp(d_disp)
	);

	initial begin
		// Initialize Inputs
		d_hamm = 7'b0011110;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

