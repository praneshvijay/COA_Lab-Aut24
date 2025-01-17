`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:44 08/28/2024 
// Design Name: 
// Module Name:    secure_router_s 
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
module secure_router_s(
    input [5:0] data_in,
    input clk,
	 input rst,
    output reg data_out0,
    output reg strobe_out0,
    output reg data_out1,
    output reg strobe_out1,
    output reg data_out2,
    output reg strobe_out2,
    output reg data_out3,
    output reg strobe_out3
);
	
	 reg [6:0] d_out;
    wire [1:0] port = data_in[5:4];
    reg [3:0] bit_count;

	always @(posedge clk or posedge rst) begin
		if(rst) begin
			bit_count = 0;
			data_out0 = 0;
			data_out1 = 0;
			data_out2 = 0;
			data_out3 = 0;
			strobe_out0 = 0;
			strobe_out1 = 0;
			strobe_out2 = 0;
			strobe_out3 = 0;
		end
		else begin
			if(bit_count == 0) begin
				d_out[6] = data_in[3] ^ data_in[2] ^ data_in[0];
				d_out[5] = data_in[3] ^ data_in[1] ^ data_in[0];
				d_out[3] = data_in[1] ^ data_in[2] ^ data_in[0];
				d_out[4] = data_in[3];
				d_out[2:0] = data_in[2:0];
			end
			else if(bit_count < 8) begin
				case(port)
                2'b00: begin
                    data_out0 = d_out[6];
						  strobe_out0 = 1'b1;
                    d_out = d_out << 1;
                end
                2'b01: begin
                    data_out1 = d_out[6];
						  strobe_out1 = 1'b1;
                    d_out = d_out << 1;
                end
                2'b10: begin
                    data_out2 = d_out[6];
						  strobe_out2 = 1'b1;
                    d_out = d_out << 1;
                end
                2'b11: begin
                    data_out3 = d_out[6];
						  strobe_out3 = 1'b1;
                    d_out = d_out << 1;
                end
            endcase
			end
			else begin
				strobe_out0 = 0;
				strobe_out1 = 0;
				strobe_out2 = 0;
				strobe_out3 = 0;
			end
			
			if(bit_count < 8) begin
				bit_count = bit_count + 1;
			end
		end
	end
	
endmodule