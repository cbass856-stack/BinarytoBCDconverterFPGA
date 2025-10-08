`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2025 01:16:52 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input [7:0] sw,
    input clk,
    output [3:0] an,
    output [6:0] seg
    );
    wire clk_out;
    wire [1:0] counter_out;
    wire [3:0] mux_out;
    wire [3:0] ones, tens, hundreds;
    wire [3:0] zeros = 4'b0000;
    
    Binary_BCD_Converter L1(sw, ones, tens, hundreds);
    fourtooneMUX L2(zeros, hundreds, tens, ones, counter_out, mux_out);
    Slow_clock L3(clk, clk_out);
    twobitcounter L4(clk_out, counter_out);
    decoder L5(counter_out, an);
    BCD7segment L6(mux_out, seg);
    
endmodule
