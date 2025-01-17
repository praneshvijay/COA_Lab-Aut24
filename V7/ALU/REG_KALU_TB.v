`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:39:26 09/11/2024
// Design Name:   REG_ALU
// Module Name:   D:/FPGA/ALU/REG_KALU_TB.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: REG_ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module REG_KALU_TB;

	// Inputs
	reg clk;
	reg [2:0] C;
	reg EN;
	reg rst;

	// Outputs
	wire [31:0] ALU_OUT;

	// Instantiate the Unit Under Test (UUT)
	REG_ALU uut (
		.clk(clk), 
		.C(C), 
		.EN(EN), 
		.rst(rst), 
		.ALU_OUT(ALU_OUT)
	);
	
	initial clk = 0;
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		C = 0;
		EN = 0;
		rst = 0;
		
		#5 rst = 1;
		
		#5 rst = 0;
		
		#50 EN =1;
		C = 0;
		
		#20
		EN = 0;
		
		#200
		EN = 1;
		C = 1;
		
		#20
		EN = 0;
		
		#5 rst = 1;
		
		#5 rst = 0;
		
		#200
		EN = 1;
		C = 4;
		
		#20
		EN = 0;
		
		#200
		EN = 1;
		C = 5;
		
		#20
		EN = 0;
		
		#200
		EN = 1;
		C = 7;
		
		#20
		EN = 0;
		
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

