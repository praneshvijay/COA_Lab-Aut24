`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:05:27 08/28/2024
// Design Name:   error_correct_s
// Module Name:   D:/FPGA/A31/error_correct_tb.v
// Project Name:  A31
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: error_correct_s
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
	reg d_in;
	reg strobe_in;

	// Outputs
	wire [3:0] d_disp;

	// Instantiate the Unit Under Test (UUT)
	error_correct_s uut (
		.d_in(d_in), 
		.strobe_in(strobe_in), 
		.d_disp(d_disp)
	);
	
	initial strobe_in = 1'b0;
	//always #5 strobe_in = ~strobe_in;
	
	initial begin
		// Initialize Inputs
		#5 
		strobe_in = 1'b1;
		d_in = 1'b1;
		
		#5
		strobe_in = 1'b0;

		// Wait 100 ns for global reset to finish
		#5;
		strobe_in = 1'b1;
		d_in = 1'b0;
		
		#5
		strobe_in = 1'b0;
		
		#5
		strobe_in = 1'b1;
		d_in = 1'b1;
		
		#5
		strobe_in = 1'b0;
		
		#5
		strobe_in = 1'b1;
		d_in = 1'b0;
		
		#5
		strobe_in = 1'b0;
		
		#5
		strobe_in = 1'b1;
		d_in = 1'b1;
		
		#5
		strobe_in = 1'b0;
		
		#5
		strobe_in = 1'b1;
		d_in = 1'b1;
		
		#5
		strobe_in = 1'b0;
		
		#5
		strobe_in = 1'b1;
		d_in = 1'b0;
		
		#5
		strobe_in = 1'b0;
		
		#5
		strobe_in = 1'b1;
		strobe_in = 1'b0;
		
		#5
		strobe_in = 1'b0;

	end
      
endmodule

