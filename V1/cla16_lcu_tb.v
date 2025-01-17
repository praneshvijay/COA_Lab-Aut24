`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:47:15 08/14/2024
// Design Name:   cla16_lcu
// Module Name:   D:/FPGA/A2/cla16_lcu_tb.v
// Project Name:  A2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cla16_lcu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module cla16_lcu_tb;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg cin;

	// Outputs
	wire [15:0] s;
	wire cout;
	wire [3:0] pout;
	wire [3:0] gout;

	// Instantiate the Unit Under Test (UUT)
	cla16_lcu uut (
		.s(s), 
		.cout(cout), 
		.pout(pout), 
		.gout(gout), 
		.a(a), 
		.b(b), 
		.cin(cin)
	);

	initial begin
		// Initialize Inputs
		a = 7;
		b = 3;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

