`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:52:03 10/01/2024
// Design Name:   HAM32
// Module Name:   D:/FPGA/ALU/HAM32_tb.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HAM32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module HAM32_tb;

	// Inputs
	reg [31:0] a;

	// Outputs
	wire [5:0] s;

	// Instantiate the Unit Under Test (UUT)
	HAM32 uut (
		.a(a), 
		.s(s)
	);

	initial begin
		// Initialize Inputs
		a = 32'b11110000000000001111000000000000;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

