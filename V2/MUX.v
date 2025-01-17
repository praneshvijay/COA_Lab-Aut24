`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 15:15:49
// Design Name: 
// Module Name: MUX
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


module MUX(
    input D0,
    input D1,
    input SEL,
    output reg Y
    );
    
    always @(*) begin
        if(SEL) begin
            Y <= D1;
        end
        else begin
            Y <= D0;
        end
    end
endmodule
