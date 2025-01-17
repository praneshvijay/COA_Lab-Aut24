`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:34:08 08/28/2024
// Design Name:   error_inject_s
// Module Name:   D:/FPGA/A31/error_inject_s_tb.v
// Project Name:  A31
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: error_inject_s
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module error_inject_s_tb;

	// Inputs
	reg d_in;
	reg strobe_in;
	reg [2:0] error_pos;
	reg clk;

	// Outputs
	wire d_out;
	wire strobe_out;

	// Instantiate the Unit Under Test (UUT)
	error_inject_s uut (
		.d_in(d_in), 
		.strobe_in(strobe_in), 
		.error_pos(error_pos), 
		.d_out(d_out), 
		.strobe_out(strobe_out),
		.clk(clk)
	);
	
	initial strobe_in = 1'b0;
	always #5 strobe_in = ~strobe_in;
	
	initial begin
		// Initialize Inputs
		#5 d_in = 1'b0;
		error_pos = 0;

		// Wait 100 ns for global reset to finish
		#10;
		d_in = 1'b0;
		
		#10;
		d_in = 1'b1;
		
		#10;
		d_in = 1'b0;
		
		#10;
		d_in = 1'b1;
		
		#10;
		d_in = 1'b1;
		
		#10;
		d_in = 1'b0;
        
		// Add stimulus here

	end
      
endmodule

