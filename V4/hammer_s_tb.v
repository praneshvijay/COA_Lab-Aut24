`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:27:15 08/28/2024
// Design Name:   hammer_s
// Module Name:   D:/FPGA/A31/hammer.v
// Project Name:  A31
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hammer_s
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hammer;

	// Inputs
	reg [5:0] d_in;
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	hammer_s uut (
		.d_in(d_in), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		d_in = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

