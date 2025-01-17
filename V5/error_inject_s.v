`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:13:10 08/28/2024 
// Design Name: 
// Module Name:    error_inject_s 
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
module error_inject_s(
    input d_in,
	 input clk,
	 input strobe_in,
	 input [2:0] error_pos,
    output reg d_out,
	 output reg strobe_out
    );
	 
	 reg [2:0] cur_pos = 3'b110;
		
	always @(posedge clk) begin
		if(strobe_in) begin
			if(cur_pos == error_pos) d_out = d_in ^ 1'b1;
			else d_out = d_in;
			cur_pos = cur_pos - 1;
			strobe_out = 1;
		end
		else strobe_out = 0;
	end

endmodule
