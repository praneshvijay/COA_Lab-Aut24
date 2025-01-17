`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:04:44 09/10/2024
// Design Name:   SUB
// Module Name:   D:/FPGA/ALU/SUB_tb.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SUB
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SUB_tb;

	// Inputs
	reg [7:0] A;
	reg [7:0] B;

	// Outputs
	wire [7:0] S;

	// Instantiate the Unit Under Test (UUT)
	SUB uut (
		.A(A), 
		.B(B), 
		.S(S)
	);

	initial begin
		// Initialize Inputs
		A = 3;
		B = 2;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

