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
    reg [1:0] port;
    reg p1, p2, p3;
    reg [3:0] bit_count = 4'b0000; // To count incoming bits for the current byte
  
	 always @(data_in) begin
	 // Calculate parity bits
            p1 = data_in[3] ^ data_in[2] ^ data_in[0];
            p2 = data_in[3] ^ data_in[1] ^ data_in[0];
            p3 = data_in[1] ^ data_in[2] ^ data_in[0];

            // Form d_out
            d_out[2:0] = data_in[2:0];
            d_out[3] = p3;
            d_out[4] = data_in[3];
            d_out[5] = p2;
            d_out[6] = p1;

            // Determine the output port based on the data_in's port bits
            port = data_in[5:4];

            // Reset strobe signals
            strobe_out0 = 0;
            strobe_out1 = 0;
            strobe_out2 = 0;
            strobe_out3 = 0;
				
				bit_count = 4'b0;
	 end

    always @(posedge clk) begin
		  if(bit_count < 4'b0111) begin
        // Output data based on port
			  case(port)
					2'b00: begin
						 data_out0 <= d_out[6];
						 d_out <= d_out << 1;
						 strobe_out0 <= 1'b1;
					end
					2'b01: begin
						 data_out1 <= d_out[6];
						 d_out <= d_out << 1;
						 strobe_out1 <= 1'b1;
					end
					2'b10: begin
						 data_out2 <= d_out[6];
						 d_out <= d_out << 1;
						 strobe_out2 <= 1'b1;
					end
					2'b11: begin
						 data_out3 <= d_out[6];
						 d_out <= d_out << 1;
						 strobe_out3 <= 1'b1;
					end
			  endcase
			  bit_count = bit_count + 1;
		  end
    end
	 
	 always @(negedge clk) begin
			if(bit_count < 4'b1000) begin
				 case(port)
						2'b00: begin
							 strobe_out0 = 1'b0;
						end
						2'b01: begin
							 strobe_out1 = 1'b0;
						end
						2'b10: begin
							 strobe_out2 = 1'b0;
						end
						2'b11: begin
							 strobe_out3 = 1'b0;
						end
				  endcase
			end
	end
endmodule


