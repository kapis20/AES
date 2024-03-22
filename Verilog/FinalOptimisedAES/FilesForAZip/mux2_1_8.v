`timescale 1ns/1ps

//simple mux design for 8 bit input and output
module mux2_1_8(in1, in2, out, s1);

    input s1;
    input [7:0] in1, in2;
    output [7:0] out;
    
    assign out = s1 ? in2 : in1;

endmodule