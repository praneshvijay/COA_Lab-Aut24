`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2024 16:31:25
// Design Name: 
// Module Name: gcd_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module gcd_tb;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg start;

	// Outputs
	wire [7:0] c;

	// Instantiate the Unit Under Test (UUT)
	gcd uut (
		.a(a), 
		.b(b),
		.start(start), 
		.c(c)
	);

	initial begin
		$monitor("time=%t | a = %d | b = %d | c = %d ", $time, a, b, c);
		
        
		// Add stimulus here
		a=4; 
		b=8;
		start=1;
		#10 start=0;
		#10;
		a=3;
		b=2;
		
		start=1;
		#10 start=0;
		#10;
		a=6;
		b=14;
		
		start=1;
		#10 start=0;
		
		#10;
		a=7;
		b=14;
		
		start=1;
		#10 start=0;
	end
      
endmodule

