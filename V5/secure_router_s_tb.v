`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:12:17 08/28/2024
// Design Name:   secure_router_s
// Module Name:   D:/FPGA/A31/secure_router_s_tb.v
// Project Name:  A31
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: secure_router_s
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module secure_router_s_tb;

	// Inputs
	reg [5:0] data_in;
	reg clk;
	reg rst;

	// Outputs
	wire data_out0;
	wire strobe_out0;
	wire data_out1;
	wire strobe_out1;
	wire data_out2;
	wire strobe_out2;
	wire data_out3;
	wire strobe_out3;

	// Instantiate the Unit Under Test (UUT)
	secure_router_s uut (
		.data_in(data_in), 
		.clk(clk), 
		.rst(rst),
		.data_out0(data_out0), 
		.strobe_out0(strobe_out0), 
		.data_out1(data_out1), 
		.strobe_out1(strobe_out1), 
		.data_out2(data_out2), 
		.strobe_out2(strobe_out2), 
		.data_out3(data_out3), 
		.strobe_out3(strobe_out3)
	);
	
	initial clk = 1'b0;
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		data_in = 6'b101110;

		// Wait 100 ns for global reset to finish
		#300;
      
		data_in = 6'b101111;
		// Add stimulus here

	end
      
endmodule

