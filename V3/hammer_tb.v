`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:31:11 08/27/2024
// Design Name:   hammer
// Module Name:   D:/FPGA/A3/hammer_tb.v
// Project Name:  A3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hammer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hammer_tb;

	// Inputs
	reg [5:0] d_in;

	// Outputs
	wire [3:0] d_disp0;
	wire [3:0] d_disp1;
	wire [3:0] d_disp2;
	wire [3:0] d_disp3;

	// Instantiate the Unit Under Test (UUT)
	hammer uut (
		.d_in(d_in), 
		.d_disp0(d_disp0), 
		.d_disp1(d_disp1), 
		.d_disp2(d_disp2), 
		.d_disp3(d_disp3)
	);

	initial begin
		// Initialize Inputs
		d_in = 6'b111110;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

