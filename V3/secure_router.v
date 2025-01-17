`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:06 08/27/2024 
// Design Name: 
// Module Name:    secure_router 
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
module secure_router(
    input [5:0] d_in,
    output reg [6:0] d_out0,
    output reg [6:0] d_out1,
    output reg [6:0] d_out2,
    output reg [6:0] d_out3
    );
	 
    reg [6:0] d_out;
    reg [1:0] port;
    reg p1, p2, p3;
	 
    always @* begin

		  d_out0 = 7'b0;
		  d_out1 = 7'b0;
		  d_out2 = 7'b0;
	     d_out3 = 7'b0;
        // Calculate parity bits
        p1 = d_in[3] ^ d_in[2] ^ d_in[0];
        p2 = d_in[3] ^ d_in[1] ^ d_in[0];
        p3 = d_in[1] ^ d_in[2] ^ d_in[0];

        // Form d_out
        d_out[2:0] = d_in[2:0];
        d_out[3] = p3;
        d_out[4] = d_in[3];
        d_out[5] = p2;
        d_out[6] = p1;

        // Determine the output based on the port
        port = d_in[5:4];
			
        case(port)
            2'b00: d_out0 = d_out;
            2'b01: d_out1 = d_out;
            2'b10: d_out2 = d_out;
            2'b11: d_out3 = d_out;
        endcase
    end

endmodule
