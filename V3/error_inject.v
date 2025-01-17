`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:17:59 08/27/2024 
// Design Name: 
// Module Name:    error_inject 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//     This module injects a single-bit error into a 7-bit input signal at a randomly
//     chosen position.
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module error_inject(
    input [6:0] d_orig,
	 input [2:0] error_pos,
    output reg [6:0] d_error
    );
	 
    always @* begin
        d_error = d_orig; // Start with the original data
        d_error[error_pos] = d_orig[error_pos] ^ 1; // Inject error by flipping the bit
    end

endmodule
