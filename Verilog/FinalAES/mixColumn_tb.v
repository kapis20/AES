`timescale 1ns/1ps

module tb_mixColumns ();



reg [127:0] input_state;
reg clk=0;
wire [127:0] output_state;
//wire ready;

mixColumns UUT (.input_s(input_state), .output_s(output_state), .clk(clk));

always #10 clk =~clk;

initial begin
    //$monitor("The input is %h and the output is %h", input_state, output_state);

    #100  
//    input_state = 128'h_d4bf5d30e0b452aeb84111f11e2798e5;  //The answer is 046681e5e0cb199a48f8d37a2806264c
//    //input_state = 128'h_49db873b453953897f02d2f177de961a;
//    $display("The input is %h", input_state);
//    $display("and the output is %h",output_state);
//    #100
   
    //input_state =128'h00000000000000000000000000000000;
//    $display("The input is %h", input_state);
//    $display("and the output is %h",output_state);
//    #100
    //input_state = 128'h_49db873b453953897f02d2f177de961a;  //The answer is 584dcaf11b4b5aacdbe7caa81b6bb0e5
//    $display("The input is %h", input_state);
//    $display("and the output is %h",output_state);
//    //#100
    //input_state =128'h00000000000000000000000000000000;
//    $display("The input is %h", input_state);
//    $display("and the output is %h",output_state);
//    #100
    
    input_state = 128'h_acc1d6b8efb55a7b1323cfdf457311b5;  //The answer is 75ec0993200b633353c0cf7cbb25d0dc
    $display("The input is %h", input_state);
    $display("and the output is %h",output_state);
    //$finish;
end

endmodule 