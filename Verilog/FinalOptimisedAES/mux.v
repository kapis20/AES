`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Boon Kean Teo
// Module Name: mux
// Project Name: AES (EEE6225)
// Description: This module will choose one of the 2 inputs as output
//////////////////////////////////////////////////////////////////////////////////


module mux(s1, in1, in2, out);

//Declaring the inputs and outputs. S1 is the select bit
input s1;
input [7:0] in1, in2;
output [7:0] out;

//When S1 is 1, then the first input 1, in1 is assigned as output and vice versa
assign out = s1 ? in1 : in2;

endmodule
