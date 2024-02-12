`timescale 1ns/1ps
//Written by B K Teo
module tb_InvMixColumns ();



reg [127:0] input_state;
reg clk=0;
wire [127:0] output_state;
//wire ready;

InvMixColumns UUT (.input_s(input_state), .output_s(output_state), .clk(clk));

always #10 clk =~clk;

initial begin

    #100
    input_state = 128'h75ec0993200b633353c0cf7cbb25d0dc;  //The answer is acc1d6b8efb55a7b1323cfdf457311b5
    $display("The input is %h", input_state);
    $display("and the output is %h",output_state);
    
    #100
    input_state = 128'h584dcaf11b4b5aacdbe7caa81b6bb0e5;  //The answer is 49db873b453953897f02d2f177de961a
    $display("The input is %h", input_state);
    $display("and the output is %h",output_state);
    
    #100
    input_state = 128'h046681e5e0cb199a48f8d37a2806264c;  //The answer is d4bf5d30e0b452aeb84111f11e2798e5
    $display("The input is %h", input_state);
    $display("and the output is %h",output_state);
    //$finish;
end

endmodule 
