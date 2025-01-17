`timescale 1ns / 1ps
// sai shree pradhan
// 22cs10089
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2024 16:29:13
// Design Name: 
// Module Name: gcd
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


module gcd(
		input [7:0] a,
		input [7:0] b,
		input start,
		output [7:0] c
    );
	
	wire [7:0] suba, subb;
	reg [7:0] areg, breg, creg;
	sub g1(areg, breg, suba); // a-b
	sub g2(breg, areg, subb); // b-a
	wire eqaz, checkb, comp;
	equalz g3(areg, eqaz); // a==0
	sgt g4(breg,8'b0,checkb); //b>0
	sgt g5(areg, breg, comp); //a>b
	
	always @(*) begin
	   if(start) begin
	        areg <= a;
            breg <= b;
	   end
	   else begin
			if(eqaz) creg <= breg;
			else begin
				if(checkb) begin
					if(comp) areg<= suba;
					else breg<=subb;
				end
				else creg <= areg;
			end
	   end
	end
	
	assign c = creg;

endmodule
