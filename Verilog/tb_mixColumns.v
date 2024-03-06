`timescale 1ns / 1ps


module tb_mixColumns();

reg [7:0] input_num;
reg [7:0] enable=0;
wire [7:0] output_num_1;
wire [7:0] output_num_2;
wire [7:0] output_num_3;
wire [7:0] output_num_4;

mixColumns_v1 UUT(.in_byte(input_num), .enable(enable), .out_byte_1(output_num_1), .out_byte_2(output_num_2), .out_byte_3(output_num_3), .out_byte_4(output_num_4));

initial begin

    #100
    enable = 8'b00000000;
    input_num = 8'h00;

    #100
    enable = 8'b11111111;
    input_num = 8'h_ac;
    
    #100
    input_num = 8'h_c1;
    
    #100
    input_num = 8'h_d6;
    
    #100
    input_num = 8'h_b8;
    end
   

endmodule
