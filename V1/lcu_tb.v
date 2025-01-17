`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:36:11 08/14/2024
// Design Name:   lcu
// Module Name:   D:/FPGA/A2/lcu_tb.v
// Project Name:  A2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lcu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lcu_tb;

	// Inputs
	reg cin;
	reg [3:0] P;
	reg [3:0] G;

	// Outputs
	wire [4:1] cout;
	wire pout;
	wire gout;

	// Instantiate the Unit Under Test (UUT)
	lcu uut (
		.cout(cout), 
		.pout(pout), 
		.gout(gout), 
		.cin(cin), 
		.P(P), 
		.G(G)
	);

	initial begin
		// Initialize Inputs
		cin = 0;
		P = 4'b0100;
		G = 4'b1001;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

