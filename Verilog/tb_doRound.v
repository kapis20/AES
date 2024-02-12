`timescale 1ns / 1ps

// Testbench to check functionality of each round
// Written by C. Baldwin
module tb_doRound;
    
    // Declare inputs
    reg clk = 0;
    reg [127:0] data_in = 128'h0123456789ABCDEF0123456789ABCDEF;
    reg [127:0] key_in = 128'h0123456789ABCDEF0123456789ABCDEF;
    
    // Declare outputs
    wire [127:0] data_out;
    
    // Instantiate UUT
    doRound uut (
        .clk(clk),
        .data_in(data_in),
        .key_in(key_in),
        .data_out(data_out)
    );
    
    // Initialise clock
    always #5 clk = !clk;
    
    initial begin
        
        $display("Round Test");
        
        $display("Input Data: %h", data_in);
        #100
        $display("Output Data: %h", data_out);
        
        $finish;
    end
    
endmodule
