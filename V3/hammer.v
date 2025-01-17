`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:26 08/27/2024 
// Design Name: 
// Module Name:    hammer 
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
module hammer(
    input [5:0] d_in,
    output [3:0] d_disp0,
    output [3:0] d_disp1,
    output [3:0] d_disp2,
    output [3:0] d_disp3
    );
	 
	 wire [6:0] d_out0, d_out1, d_out2, d_out3;
	 wire [6:0] d_err0, d_err1, d_err2, d_err3;
	 reg [2:0] err_pos0, err_pos1, err_pos2, err_pos3;
	 initial begin
        err_pos0 = 3'b000;
        err_pos1 = 3'b010;
        err_pos2 = 3'b100;
        err_pos3 = 3'b110;
    end
	 
	 secure_router sec_rtr(d_in, d_out0, d_out1, d_out2, d_out3);
	 
	 error_inject err_inj0(d_out0, err_pos0, d_err0);
	 error_inject err_inj1(d_out1, err_pos1, d_err1);
	 error_inject err_inj2(d_out2, err_pos2, d_err2);
	 error_inject err_inj3(d_out3, err_pos3, d_err3);
	 
	 error_correct err_crt0(d_err0, d_disp0);
	 error_correct err_crt1(d_err1, d_disp1);
	 error_correct err_crt2(d_err2, d_disp2);
	 error_correct err_crt3(d_err3, d_disp3);

endmodule
