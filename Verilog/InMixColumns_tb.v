`timescale 1ns/1ps

module tb_InvMixColumns ();



reg [127:0] input_state;
reg clk=0;
wire [127:0] output_state;
//wire ready;

InvMixColumns UUT (.input_s(input_state), .output_s(output_state), .clk(clk));

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
    #100
//    input_state =128'h00512fd1b1c889ff54766dcdfa1b99ea; // The answer is be3bd4fed4e1f2c80a642cc0da83864d
//    $display("The input is %h", input_state);
//    $display("and the output is %h",output_state);
    //#100
    
    input_state = 128'h_473794ed40d4e4a5a3703aa64c9f42bc;  //The answer is 876e46a6f24ce78c4d904ad897ecc395
    $display("The input is %h", input_state);
    $display("and the output is %h",output_state);
    //$finish;
end

endmodule 