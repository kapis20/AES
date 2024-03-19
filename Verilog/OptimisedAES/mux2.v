`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Boon Kean Teo
// Module Name: mux2
// Project Name: AES (EEE6225)
// Description: This module will choose one of the 4 inputs as output. 
//////////////////////////////////////////////////////////////////////////////////

module mux2(s1, s2, in1, in2, in3, in4, out);

//Declaring the inputs and outputs. S1 and S2 are the select bits
input s1, s2;
input [7:0] in1, in2, in3, in4;
output [7:0] out;

//When S1 is 0, S2 is 0, then the first input, in1 is assigned as output
//When S1 is 0, S2 is 1, then the second input, in2 is assigned as output
//When S1 is 1, S2 is 0, then the third input, in3 is assigned as output
//When S1 is 1, S2 is 1, then the fourth input 1, in4 is assigned as output
assign  out = s1 ? (s2 ? in4 : in3) : (s2 ? in2 : in1);

endmodule
