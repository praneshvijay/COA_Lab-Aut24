`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:10:52 10/16/2024 
// Design Name: 
// Module Name:    DET_POS 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module DET_POS(
    input clk,
    input btn,
    output pos
    );
	 
	 reg delay;
	 
	 always @(posedge clk) begin
		delay <= btn;
	 end
	 
	 assign pos = btn & ~delay;
	 
endmodule
