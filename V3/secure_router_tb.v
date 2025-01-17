`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:11:12 08/27/2024
// Design Name:   secure_router
// Module Name:   D:/FPGA/A3/secure_router_tb.v
// Project Name:  A3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: secure_router
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module secure_router_tb;

	// Inputs
	reg [5:0] d_in;

	// Outputs
	wire [6:0] d_out0;
	wire [6:0] d_out1;
	wire [6:0] d_out2;
	wire [6:0] d_out3;

	// Instantiate the Unit Under Test (UUT)
	secure_router uut (
		.d_in(d_in), 
		.d_out0(d_out0), 
		.d_out1(d_out1), 
		.d_out2(d_out2), 
		.d_out3(d_out3)
	);

	initial begin
		// Initialize Inputs
		d_in = 6'b001110;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

