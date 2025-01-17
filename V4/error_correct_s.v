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
	 input strobe_in,
	 output reg [3:0] d_disp
    );
	 
	 reg [6:0] d_correct;
	 reg [2:0] c, error_index;
	 reg [6:0] d_hamm;
	 reg [3:0] counter = 4'b0111;
	 reg [3:0] index;
	 
	 always @(posedge strobe_in) begin
		if(counter > 4'b0) begin
			index <= counter - 1;
			d_hamm[index] <= d_in;
			counter <= counter - 1;
		end
	 end
	 
	 always @(counter == 4'b0) begin
			c[0] = d_hamm[6] ^ d_hamm[4] ^ d_hamm[2] ^ d_hamm[0];
			c[1] = d_hamm[5] ^ d_hamm[4] ^ d_hamm[1] ^ d_hamm[0];
			c[2] = d_hamm[3] ^ d_hamm[2] ^ d_hamm[1] ^ d_hamm[0];
			
			error_index = 3'b111 - c;
			
			d_correct = d_hamm;
			d_correct[error_index] = d_hamm[error_index] ^ 1;
			d_disp[2:0] = d_correct[2:0];
			d_disp[3] = d_correct[4];
			
			counter = counter + 1;
	 end

endmodule
