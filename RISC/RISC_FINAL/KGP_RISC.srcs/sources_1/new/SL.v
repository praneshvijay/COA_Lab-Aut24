`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2024 01:28:36
// Design Name: 
// Module Name: SL
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


module SL(
    input [31:0] A,
    input B,
    output [31:0] C
);

    genvar i;
    generate
        for (i = 31; i > 0; i = i - 1) begin 
            MUX2to1 mux_inst (
                .in0(A[i]),        // Original bit
                .in1(A[i-1]),      // Left-shifted bit
                .sel(B),           // Select signal
                .out(C[i])         // Output bit
            );
        end
    endgenerate

    MUX2to1 msb_mux (
        .in0(A[0]),
        .in1(1'b0),
        .sel(B),
        .out(C[0])
    );

endmodule

