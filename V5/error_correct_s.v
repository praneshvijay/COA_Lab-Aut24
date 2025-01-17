`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:12 08/28/2024 
// Design Name: 
// Module Name:    error_correct_s 
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
module error_correct_s(
    input d_in,
	 input clk,
	 input rst,
	 input strobe_in,
	 output reg [3:0] d_disp
    );
	 
	 reg [6:0] d_correct;
	 reg [2:0] c, error_index;
	 reg [6:0] d_hamm;
	 reg [3:0] counter = 4'b000;
	 reg flag = 0;
	 
	 always @(posedge clk or posedge rst) begin
		if(rst) begin
			d_disp = 0;
		end
		else begin
			if(strobe_in) begin
				counter = counter + 1;
				d_hamm[6:1] = d_hamm[5:0];
				d_hamm[0] = d_in;
				if(counter == 4'b111) flag = 1;
			end
			
			if(flag) begin
				c[0] = d_hamm[6] ^ d_hamm[4] ^ d_hamm[2] ^ d_hamm[0];
				c[1] = d_hamm[5] ^ d_hamm[4] ^ d_hamm[1] ^ d_hamm[0];
				c[2] = d_hamm[3] ^ d_hamm[2] ^ d_hamm[1] ^ d_hamm[0];
				
				error_index = 3'b111 - c;
				
				d_correct = d_hamm;
				d_correct[error_index] = d_hamm[error_index] ^ 1;
				d_disp[2:0] = d_correct[2:0];
				d_disp[3] = d_correct[4];
				
				flag = 0;
			end
	   end
	end
endmodule
