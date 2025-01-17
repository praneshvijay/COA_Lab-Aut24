`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:16:27 09/03/2024
// Design Name:   hammer_s
// Module Name:   D:/FPGA/A31/hammer_s_tb.v
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

module hammer_s_tb;

	// Inputs
	reg [5:0] d_in;
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] d_disp0;
	wire [3:0] d_disp1;
	wire [3:0] d_disp2;
	wire [3:0] d_disp3;
	
	// Instantiate the Unit Under Test (UUT)
	hammer_s uut (
		.d_in(d_in), 
		.clk(clk), 
		.rst(rst),
		.d_disp0(d_disp0), 
		.d_disp1(d_disp1), 
		.d_disp2(d_disp2), 
		.d_disp3(d_disp3)
	);
	initial clk = 1'b0;
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		rst = 1;
		#10;
		rst = 0;
		d_in = 6'b101110;
		
		// Wait 100 ns for global reset to finish
		#500;
      rst = 1;
		#10;
		rst = 0;
		d_in = 6'b001010;
		// Add stimulus here

	end
      
endmodule

