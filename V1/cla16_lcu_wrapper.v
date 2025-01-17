`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:35 08/20/2024 
// Design Name: 
// Module Name:    cla16_lcu_wrapper 
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
module cla16_lcu_wrapper(input CLK, input RST, input [7:0] DIN, input [7:0] ADDR, input RDWR, output [7:0] DOUT);

	reg [32:0] DATA_IN;
	reg [24:0] DATA_OUT;

	reg [7:0] dout_reg;


	wire [15:0] sum;
	wire cout;
	wire [3:0] P;
	wire [3:0] G;


	assign DOUT = dout_reg;

	always@(posedge CLK)
	begin
		 if(RST) DATA_IN <= 33'd0;
		 else if(RDWR) 
		 begin
		 case(ADDR)
		 8'd0: DATA_IN <= {DATA_IN[32:8],DIN};
		 8'd1: DATA_IN <= {DATA_IN[32:16],DIN,DATA_IN[7:0]};
		 8'd2: DATA_IN <= {DATA_IN[32:24],DIN,DATA_IN[15:0]};
		 8'd3: DATA_IN <= {DATA_IN[32],DIN,DATA_IN[23:0]};
		 8'd4: DATA_IN <= {DIN[0],DATA_IN[31:0]};
		 default: DATA_IN <= 33'd0;
		 endcase
		 end
		 else DATA_IN <= DATA_IN;
	end

	always@(posedge CLK)
	begin
		 if(RST) dout_reg <= 8'd0;
		 else if(~RDWR) 
		 begin
		 case(ADDR)
		 8'd0: dout_reg <= DATA_OUT[7:0];
		 8'd1: dout_reg <= DATA_OUT[15:8];
		 8'd2: dout_reg <= DATA_OUT[23:16];
		 8'd3: dout_reg <= {7'd0,DATA_OUT[24]};
		 default: dout_reg <= 8'hF0;
		 endcase
		 end
		 else dout_reg <= 8'h0F;
	end

always@(posedge CLK)
begin
    if(RST) DATA_OUT <= 25'd0;
    else
        begin
            DATA_OUT <= {cout, sum, P, G};
        end
end

(* keep_hierarchy = "yes" *) cla16_lcu(.s(sum), .cout(cout), .pout(P), .gout(G), .a(DATA_IN[15:0]), .b(DATA_IN[31:16]), .cin(DATA_IN[32]));

endmodule
