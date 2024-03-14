`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 14:10:44
// Design Name: 
// Module Name: shiftrows
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

`include "unisims/verilog/SRL16E.v" 

module shiftrows(
input [7:0] inBits,
input clk, 
output reg [7:0] outBits);

wire [7:0] mux1_output;
SRL16 First_SRL16(
.Q (bits_shifted_output1),
.A0 (a),
.A1 (b),
.A2 (c),
.A3 (d), 
.CLK (input_clk),
.D (inBits_16)
);

SRL16 SecondSRL16(
.Q (bits_shifted_output2),
.A0 (a),
.A1 (b),
.A2 (c),
.A3 (d), 
.CLK (input_clk),
.D (inBits_16)
);

mux2_1 mux1(bits_shifted_output1,bits_shifted_output2,A4,mux1_output);
mux2_1 mux2(mux1_output,inBits,A5, outBits); 



endmodule
