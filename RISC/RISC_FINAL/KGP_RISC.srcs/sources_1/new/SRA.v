`timescale 1ns / 1ps

module SRA(
    input [31:0] A,
    input B,
    output [31:0] C
);

    genvar i;
    generate
        for (i = 0; i < 31; i = i + 1) begin 
            MUX2to1 mux_inst (
                .in0(A[i]),        
                .in1(A[i+1]),     
                .sel(B),           
                .out(C[i])         
            );
        end
    endgenerate
    assign C[31] = A[31];
endmodule
