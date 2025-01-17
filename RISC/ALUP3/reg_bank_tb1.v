`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:47:47 09/11/2024
// Design Name:   REG_BANK
// Module Name:   D:/FPGA/ALU/reg_bank_tb1.v
// Project Name:  ALU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: REG_BANK
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module reg_bank_tb1;

	// Inputs
	reg clk;
	reg rst;
	reg [2:0] SRC_REG1;
	reg [2:0] SRC_REG2;
	reg [2:0] DEST_REG;
	reg [31:0] WRT_DATA;
	reg EN;

	// Outputs
	wire [31:0] REG1_DATA;
	wire [31:0] REG2_DATA;

	// Instantiate the Unit Under Test (UUT)
	REG_BANK uut (
		.clk(clk), 
		.rst(rst), 
		.SRC_REG1(SRC_REG1), 
		.SRC_REG2(SRC_REG2), 
		.DEST_REG(DEST_REG), 
		.WRT_DATA(WRT_DATA), 
		.EN(EN), 
		.REG1_DATA(REG1_DATA), 
		.REG2_DATA(REG2_DATA)
	);
	initial clk =0;
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		rst = 0;
		SRC_REG1 = 0;
		SRC_REG2 = 0;
		DEST_REG = 0;
		WRT_DATA = 0;
		EN = 0;
		
		#100
		WRT_DATA = 3;
		DEST_REG = 3;
		
		#100
		EN = 1;
		SRC_REG1 = 3;
		SRC_REG2 = 5;
		
		#50
		rst =1;
		
		#50
		rst =0;
		
		
		// Wait 100 ns for global reset to finish
		#100;
       rst =1;

	end
      
endmodule

