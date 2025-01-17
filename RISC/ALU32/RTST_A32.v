`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:06 09/11/2024 
// Design Name: 
// Module Name:    RTST_A32 
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
module RTST_A32(
    input [31:0] A,
    input [31:0] B,
    output [31:0] C
    );
	 
	 wire overflow;
	 wire [4:0] SEL;
	 assign SEL = B[4:0];
	 wire [31:0] S;
	 
	 or over(overflow, B[31], B[30], B[29], B[28], B[27], B[26], B[25], B[24], B[23], B[22], B[21], B[20], B[19], B[18], B[17], B[16], B[15], B[14], B[13], B[12], B[11], B[10], B[9], B[8], B[7], B[6], B[5]); 
	 
    genvar i;
	 generate
	     for(i = 31; i >= 0; i = i - 1) begin
		     MUX321 M({{(i){A[31]}}, A[31:i]}, SEL, S[i]);
		  end
	 endgenerate
	 
	 genvar j;
	 generate
	     for(j = 31; j >= 0; j = j - 1) begin
		     MUX21 N({A[31], S[j]}, overflow, C[j]);
		  end
	 endgenerate
	
endmodule
