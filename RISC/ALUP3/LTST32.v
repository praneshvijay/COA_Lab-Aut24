`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:05:20 09/11/2024 
// Design Name: 
// Module Name:    LTST32 
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
module LTST32(
    input [31:0] A,
    input [31:0] B,
    output [31:0] C
    );
	 
	 wire overflow;
	 wire [4:0] SEL;
	 assign SEL = B[4:0];
	 wire [31:0] S;
	 
	 or over(overflow, B[31], B[30], B[29], B[28], B[27], B[26], B[25], B[24], B[23], B[22], B[21], B[20], B[19], B[18], B[17], B[16], B[15], B[14], B[13], B[12], B[11], B[10], B[9], B[8], B[7], B[6], B[5]); 
	 
      MUX321 M31({A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16], A[17], A[18], A[19], A[20], A[21], A[22], A[23], A[24], A[25], A[26], A[27], A[28], A[29], A[30], A[31]}, SEL, S[31]);
		MUX321 M30({1'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16], A[17], A[18], A[19], A[20], A[21], A[22], A[23], A[24], A[25], A[26], A[27], A[28], A[29], A[30]}, SEL, S[30]);
		MUX321 M29({2'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16], A[17], A[18], A[19], A[20], A[21], A[22], A[23], A[24], A[25], A[26], A[27], A[28], A[29]}, SEL, S[29]);
		MUX321 M28({3'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16], A[17], A[18], A[19], A[20], A[21], A[22], A[23], A[24], A[25], A[26], A[27], A[28]}, SEL, S[28]);
		MUX321 M27({4'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16], A[17], A[18], A[19], A[20], A[21], A[22], A[23], A[24], A[25], A[26], A[27]}, SEL, S[27]);
		MUX321 M26({5'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16], A[17], A[18], A[19], A[20], A[21], A[22], A[23], A[24], A[25], A[26]}, SEL, S[26]);
		MUX321 M25({6'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16], A[17], A[18], A[19], A[20], A[21], A[22], A[23], A[24], A[25]}, SEL, S[25]);
		MUX321 M24({7'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16], A[17], A[18], A[19], A[20], A[21], A[22], A[23], A[24]}, SEL, S[24]);
		MUX321 M23({8'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16], A[17], A[18], A[19], A[20], A[21], A[22], A[23]}, SEL, S[23]);
		MUX321 M22({9'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16], A[17], A[18], A[19], A[20], A[21], A[22]}, SEL, S[22]);
		MUX321 M21({10'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16], A[17], A[18], A[19], A[20], A[21]}, SEL, S[21]);
		MUX321 M20({11'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16], A[17], A[18], A[19], A[20]}, SEL, S[20]);
		MUX321 M19({12'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16], A[17], A[18], A[19]}, SEL, S[19]);
		MUX321 M18({13'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16], A[17], A[18]}, SEL, S[18]);
		MUX321 M17({14'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16], A[17]}, SEL, S[17]);
		MUX321 M16({15'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15], A[16]}, SEL, S[16]);
		MUX321 M15({16'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14], A[15]}, SEL, S[15]);
		MUX321 M14({17'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13], A[14]}, SEL, S[14]);
		MUX321 M13({18'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12], A[13]}, SEL, S[13]);
		MUX321 M12({19'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11], A[12]}, SEL, S[12]);
		MUX321 M11({20'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10], A[11]}, SEL, S[11]);
		MUX321 M10({21'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9], A[10]}, SEL, S[10]);
		MUX321 M9({22'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8], A[9]}, SEL, S[9]);
		MUX321 M8({23'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7], A[8]}, SEL, S[8]);
		MUX321 M7({24'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6], A[7]}, SEL, S[7]);
		MUX321 M6({25'b0, A[0], A[1], A[2], A[3], A[4], A[5], A[6]}, SEL, S[6]);
		MUX321 M5({26'b0, A[0], A[1], A[2], A[3], A[4], A[5]}, SEL, S[5]);
		MUX321 M4({27'b0, A[0], A[1], A[2], A[3], A[4]}, SEL, S[4]);
		MUX321 M3({28'b0, A[0], A[1], A[2], A[3]}, SEL, S[3]);
		MUX321 M2({29'b0, A[0], A[1], A[2]}, SEL, S[2]);
		MUX321 M1({30'b0, A[0], A[1]}, SEL, S[1]);
		MUX321 M0({31'b0, A[0]}, SEL, S[0]);

		 MUX21 N31 ({1'b0, S[31]}, overflow, C[31]);
		 MUX21 N30 ({1'b0, S[30]}, overflow, C[30]);
		 MUX21 N29 ({1'b0, S[29]}, overflow, C[29]);
		 MUX21 N28 ({1'b0, S[28]}, overflow, C[28]);
		 MUX21 N27 ({1'b0, S[27]}, overflow, C[27]);
		 MUX21 N26 ({1'b0, S[26]}, overflow, C[26]);
		 MUX21 N25 ({1'b0, S[25]}, overflow, C[25]);
		 MUX21 N24 ({1'b0, S[24]}, overflow, C[24]);
		 MUX21 N23 ({1'b0, S[23]}, overflow, C[23]);
		 MUX21 N22 ({1'b0, S[22]}, overflow, C[22]);
		 MUX21 N21 ({1'b0, S[21]}, overflow, C[21]);
		 MUX21 N20 ({1'b0, S[20]}, overflow, C[20]);
		 MUX21 N19 ({1'b0, S[19]}, overflow, C[19]);
		 MUX21 N18 ({1'b0, S[18]}, overflow, C[18]);
		 MUX21 N17 ({1'b0, S[17]}, overflow, C[17]);
		 MUX21 N16 ({1'b0, S[16]}, overflow, C[16]);
		 MUX21 N15 ({1'b0, S[15]}, overflow, C[15]);
		 MUX21 N14 ({1'b0, S[14]}, overflow, C[14]);
		 MUX21 N13 ({1'b0, S[13]}, overflow, C[13]);
		 MUX21 N12 ({1'b0, S[12]}, overflow, C[12]);
		 MUX21 N11 ({1'b0, S[11]}, overflow, C[11]);
		 MUX21 N10 ({1'b0, S[10]}, overflow, C[10]);
		 MUX21 N9  ({1'b0, S[9]},  overflow, C[9]);
		 MUX21 N8  ({1'b0, S[8]},  overflow, C[8]);
		 MUX21 N7  ({1'b0, S[7]},  overflow, C[7]);
		 MUX21 N6  ({1'b0, S[6]},  overflow, C[6]);
		 MUX21 N5  ({1'b0, S[5]},  overflow, C[5]);
		 MUX21 N4  ({1'b0, S[4]},  overflow, C[4]);
		 MUX21 N3  ({1'b0, S[3]},  overflow, C[3]);
		 MUX21 N2  ({1'b0, S[2]},  overflow, C[2]);
		 MUX21 N1  ({1'b0, S[1]},  overflow, C[1]);
		 MUX21 N0  ({1'b0, S[0]},  overflow, C[0]);
	
endmodule
