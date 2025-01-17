`timescale 1ns / 1ps

module SRL(
    input [31:0] A,
    input B,
    output [31:0] C
);
    //Vishar7668$
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

    MUX2to1 msb_mux (
        .in0(A[31]),
        .in1(1'b0),
        .sel(B),
        .out(C[31])
    );

endmodule
