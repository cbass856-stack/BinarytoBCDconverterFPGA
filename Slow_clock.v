`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2025 11:00:15 AM
// Design Name: 
// Module Name: Slow_clock
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


module Slow_clock(
    input clk_in,
    output reg clk_out
    );
    reg [20:0] count =0;
    
    
    always @(posedge clk_in)
        begin
            count <= count + 1;
            if (count == 500_000)
            begin 
            count <= 0;
            clk_out=~clk_out;
            end
        end
        
endmodule
