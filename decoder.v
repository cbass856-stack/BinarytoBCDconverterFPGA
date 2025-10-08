`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2025 01:06:21 PM
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [1:0] en,
    output reg [3:0] an
    );

    always @(en)
    begin
    case (en)
    2'b00: an = 4'b1110; // Enable thousands digit (an[0]) for the zeros input
    2'b01: an = 4'b1101; // Enable hundreds digit (an[1])
    2'b10: an = 4'b1011; // Enable tens digit (an[2])
    2'b11: an = 4'b0111; // Enable ones digit (an[3])
    default: an = 4'b1111; // Turn all digits off
    endcase
    end
endmodule

