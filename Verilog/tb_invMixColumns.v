`timescale 1ns / 1ps


module tb_invMixColumns();

reg [7:0] input_num;
reg [7:0] enable=0;
wire [7:0] output_num_1;
wire [7:0] output_num_2;
wire [7:0] output_num_3;
wire [7:0] output_num_4;

invMixColumns_v1 UUT(.in_byte(input_num), .enable(enable), .out_byte_1(output_num_1), .out_byte_2(output_num_2), .out_byte_3(output_num_3), .out_byte_4(output_num_4));

initial begin

    #100
    enable = 8'b00000000;
    input_num = 8'h00;

    #100
    enable = 8'b11111111;
    input_num = 8'h_75;
    
    #100
    input_num = 8'h_ec;
    
    #100
    input_num = 8'h_09;
    
    #100
    input_num = 8'h_93;
    end
   
endmodule
