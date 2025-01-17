`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:53:09 09/10/2024
// Design Name:   K_ALU
// Module Name:   D:/FPGA/ALU/K_ALU_tb.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: K_ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module K_ALU_tb;

	// Inputs
	reg [5:0] A;
	reg [5:0] B;
	reg [3:0] CMD;

	// Outputs
	wire [5:0] Z;

	// Instantiate the Unit Under Test (UUT)
	K_ALU #(.N(6)) uut (
		A, B, CMD, Z
	);

	initial begin
		// Initialize Inputs
		
		A = 6'd5;
		B = 6'd3;
		CMD = 4'd0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

