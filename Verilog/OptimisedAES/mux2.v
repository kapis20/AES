`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2024 10:40:51
// Design Name: 
// Module Name: mux2
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


module mux2(s1, s2, in1, in2, in3, in4, out);

input s1, s2;
input [7:0] in1, in2, in3, in4;
output [7:0] out;


assign  out = s1 ? (s2 ? in4 : in3) : (s2 ? in2 : in1);

endmodule