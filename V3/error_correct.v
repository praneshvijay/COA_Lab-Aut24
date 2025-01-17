`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:24 08/27/2024 
// Design Name: 
// Module Name:    error_correct 
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
module error_correct(
    input [6:0] d_hamm,
    output reg [3:0] d_disp
    );
	 
	 reg [6:0] d_correct;
	 reg [2:0] c, error_index;
	 
	 always @* begin
			c[0] = d_hamm[6] ^ d_hamm[4] ^ d_hamm[2] ^ d_hamm[0];
			c[1] = d_hamm[5] ^ d_hamm[4] ^ d_hamm[1] ^ d_hamm[0];
			c[2] = d_hamm[3] ^ d_hamm[2] ^ d_hamm[1] ^ d_hamm[0];
			
			error_index = 3'b111 - c;
			
			d_correct = d_hamm;
			d_correct[error_index] = d_hamm[error_index] ^ 1;
			d_disp[2:0] = d_correct[2:0];
			d_disp[3] = d_correct[4];
			
	 end

endmodule
