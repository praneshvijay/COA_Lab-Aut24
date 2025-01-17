`timescale 1ns / 1ps
module DEC #(parameter N = 32)
(
    input [N-1:0] A,
    output [N-1:0] C
);

	 SUB #(.N(N)) G(A, 'd4, C);

endmodule
