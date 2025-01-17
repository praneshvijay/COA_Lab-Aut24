`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:13:09 10/16/2024
// Design Name:   REG_ALU
// Module Name:   D:/FPGA/ALU/P3_tb.v
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

module P3_tb;

	// Inputs
	reg clk;
	reg [15:0] INS;
	reg btn;
	reg rst;

	// Outputs
	wire [15:0] OUT;

	// Instantiate the Unit Under Test (UUT)
	REG_ALU uut (
		.clk(clk), 
		.INS(INS), 
		.btn(btn),
		.rst(rst), 
		.OUT(OUT)
	);
	
	initial clk = 0;
	always #5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		#20 rst = 1;
		#20 rst = 0;
		
		#10 INS = 16'b0000001000110100;
		#10 btn = 1;
		#10 btn = 0;
		
		#10 btn = 1;
		#10 btn = 0;
		
		#10 btn = 1;
		#10 btn = 0;
		
		#10 INS = 16'b0001010000010100;
		#10 btn = 1;
		#10 btn = 0;
		
		#10 btn = 1;
		#10 btn = 0;
		
		#10 btn = 1;
		#10 btn = 0;
		
		#10 INS = 16'b0001010000010100;
		#10 btn = 1;
		#10 btn = 0;
		
		#10 btn = 1;
		#10 btn = 0;
		
		#10 btn = 1;
		#10 btn = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

