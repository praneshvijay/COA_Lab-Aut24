`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 16:01:04
// Design Name: 
// Module Name: LFSR
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


module LFSR(
    input wire [3:0] SEED,
    input wire RST,
    input wire SEL,
    input wire clk,
    output wire [3:0] STATE
    );
    
    wire CLK;
    CLKDiv CK(clk, RST, CLK); 
    
    wire w1, w2, w3, w4, w5;
    wire [3:0] win;
    
    assign w1 = w4 ^ w5;

	MUX M0(SEED[0], w4, SEL, win[3]);
	DFF D0(win[3], CLK, RST, w5);
	
	MUX M1(SEED[1], w3, SEL, win[2]);
	DFF D1(win[2], CLK, RST, w4);
	
	MUX M2(SEED[2], w2, SEL, win[1]);
	DFF D2(win[1], CLK, RST, w3);
	
	MUX M3(SEED[3], w1, SEL, win[0]);
	DFF D3(win[0], CLK, RST, w2);
	
	assign STATE = {w2, w3, w4, w5};
    
endmodule
