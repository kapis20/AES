`timescale 1ns / 1ps


module tb_invMixColumns();

reg [7:0] input_num;
reg [7:0] enable=0;
reg clock=0;
wire [7:0] output_num_1;
wire [7:0] output_num_2;
wire [7:0] output_num_3;
wire [7:0] output_num_4;

always #10 clock = !clock;

invMixColumns_v1 UUT(.in_byte(input_num), .clock(clock), .enable(enable), .out_byte_1(output_num_1), .out_byte_2(output_num_2), .out_byte_3(output_num_3), .out_byte_4(output_num_4));

initial begin

    #10
    enable = 8'b00000000;
    input_num = 8'h_75;
    
    #20
    enable = 8'b11111111;
    input_num = 8'h_ec;
    
    #20
    input_num = 8'h_09;
    
    #20
    input_num = 8'h_93;
    
    #20
    enable = 8'b00000000;
    input_num = 8'h_20;
    
    #20
    enable = 8'b11111111;
    input_num = 8'h_0b;
    
    #20
    input_num = 8'h_63;
    
    #20
    input_num = 8'h_33;
    
    
    #10
    $finish;
    end
   
endmodule
