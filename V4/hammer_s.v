`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:25 08/28/2024 
// Design Name: 
// Module Name:    hammer_s 
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
module hammer_s(
    input [5:0] d_in,
	 input clk;
    output [3:0] d_disp0,
    output [3:0] d_disp1,
    output [3:0] d_disp2,
    output [3:0] d_disp3
    );
	 
	 wire [6:0] d_out0, d_out1, d_out2, d_out3;
	 wire [6:0] d_err0, d_err1, d_err2, d_err3;
	 reg [2:0] err_pos0, err_pos1, err_pos2, err_pos3;
	 wire s0, d0, s1, d1, s2, d2, s3, d3;
	 wire s00, d00, s11, d11, s22, d22, s33, d33;
	 initial begin
        err_pos0 = 3'b000;
        err_pos1 = 3'b010;
        err_pos2 = 3'b100;
        err_pos3 = 3'b110;
    end
	 
	 secure_router_s sec_rtr(d_in, clk, d0, s0, d1, s1, d2, s2, d3, s3);
	 
	 error_inject_s err_inj0(d0, s0, err_pos0, d00, s00);
	 error_inject_s err_inj1(d1, s1, err_pos1, d11, s11);
	 error_inject_s err_inj2(d2, s2, err_pos2, d22, s22);
	 error_inject_s err_inj3(d3, s3, err_pos3, d33, s33);
	 
	 error_correct_s err_crt0(d00, s00, d_disp0);
	 error_correct_s err_crt1(d11, s11, d_disp1);
	 error_correct_s err_crt2(d22, s22, d_disp2);
	 error_correct_s err_crt3(d33, s33, d_disp3);

endmodule
