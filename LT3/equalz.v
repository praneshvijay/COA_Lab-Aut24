`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2024 16:30:30
// Design Name: 
// Module Name: equalz
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


module equalz(
		input [7:0] a,
		output reg c
    );
	 always @(*) begin
		if(a==0) c<=1;
		else c<=0;
	 end


endmodule
