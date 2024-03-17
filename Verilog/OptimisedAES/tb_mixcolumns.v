`timescale 1ns / 1ps


module tb_mixColumns();

/*reg [7:0] input_num;
reg [7:0] enable=0;
reg clock=0;
wire [7:0] output_num_1;
wire [7:0] output_num_2;
wire [7:0] output_num_3;
wire [7:0] output_num_4;

always #10 clock = !clock;

mixColumns UUT(.in_byte(input_num), .clock(clock), .enable(enable), .out_byte_1(output_num_1), .out_byte_2(output_num_2), .out_byte_3(output_num_3), .out_byte_4(output_num_4));

initial begin


    #10
    enable = 8'b00000000;
    input_num = 8'h_ac;
    
    #20
    enable = 8'b11111111;
    input_num = 8'h_c1;
    
    #20
    input_num = 8'h_d6;
    
    #20
    input_num = 8'h_b8;
    
    #20
    enable = 8'b00000000;
    input_num = 8'h_ef;
    
    #20
    enable = 8'b11111111;
    input_num = 8'h_b5;
    
    #20
    input_num = 8'h_5a;
    
    #20
    input_num = 8'h_7b;
    
    
    #10
    $finish;
    end*/
   
   reg [7:0] input_num;
   reg [7:0] enable=0;
   reg clock=0;
   wire [7:0] output_num;
   
   
   always #10 clock = !clock;
   
   mixColumns UUT(.in_byte(input_num), .clock(clock), .enable(enable), .out_byte(output_num));
   
   
   initial begin


    #10
    enable = 8'b00000000;
    input_num = 8'h_ac;
    
    #20
    enable = 8'b11111111;
    input_num = 8'h_c1;
    
    #20
    input_num = 8'h_d6;
    
    #20
    input_num = 8'h_b8;
    
    #20
    enable = 8'b00000000;
    input_num = 8'h_ef;
    
    #20
    enable = 8'b11111111;
    input_num = 8'h_b5;
    
    #20
    input_num = 8'h_5a;
    
    #20
    input_num = 8'h_7b;
    
    
    #10
    $finish;
    end
   


endmodule