`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2025 10:44:51 PM
// Design Name: 
// Module Name: Binary_BCD_Converter
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


module Binary_BCD_Converter(
    input [7:0] bin,
    output [3:0] hundreds,
    output [3:0] tens,
    output [3:0] ones
);
    reg [11:0] bcd_temp = 0;
    integer i;
    
    always @(bin) begin
        bcd_temp = 0; // Reset bcd_temp for each new input
        for (i = 7; i >= 0; i = i-1) begin
            // Add 3 to any BCD digit >= 5
            if (bcd_temp[11:8] >= 4'd5) bcd_temp[11:8] = bcd_temp[11:8] + 3;
            if (bcd_temp[7:4] >= 4'd5) bcd_temp[7:4] = bcd_temp[7:4] + 3;
            if (bcd_temp[3:0] >= 4'd5) bcd_temp[3:0] = bcd_temp[3:0] + 3;
            
            // Shift left and append the next binary bit
            bcd_temp = {bcd_temp[10:0], bin[i]};
        end
    end
    
    assign hundreds = bcd_temp[11:8];
    assign tens = bcd_temp[7:4];
    assign ones = bcd_temp[3:0];
endmodule

