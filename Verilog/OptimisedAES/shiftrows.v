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
S
// SRL16E: 16-bit shift register LUT with clock enable operating
//         on posedge of clock (Mapped to a SliceM LUT6)
//         7 Series
// Xilinx HDL Language Template, version 2021.2

SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_inst (
   .Q(Q),       // SRL data output
   .A0(A0),     // Select[0] input
   .A1(A1),     // Select[1] input
   .A2(A2),     // Select[2] input
   .A3(A3),     // Select[3] input
   .CE(CE),     // Clock enable input
   .CLK(CLK),   // Clock input
   .D(D)        // SRL data input
);

// End of SRL16E_inst instantiation


// SRL16E: 16-bit shift register LUT with clock enable operating
//         on posedge of clock (Mapped to a SliceM LUT6)
//         7 Series
// Xilinx HDL Language Template, version 2021.2

SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_inst (
   .Q(Q),       // SRL data output
   .A0(A0),     // Select[0] input
   .A1(A1),     // Select[1] input
   .A2(A2),     // Select[2] input
   .A3(A3),     // Select[3] input
   .CE(CE),     // Clock enable input
   .CLK(CLK),   // Clock input
   .D(D)        // SRL data input
);

// End of SRL16E_inst instantiation

mux2_1 mux1(bits_shifted_output1,bits_shifted_output2,A4,mux1_output);
mux2_1 mux2(mux1_output,inBits,A5, outBits); 



endmodule
