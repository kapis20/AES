`timescale 1ns / 1ps

// Testbench that allows for data and key input, and produces an encrypted output
// Written by C. Baldwin
module tb_mainAES;
    
    // Declare inputs
    reg clk = 0;
    reg [127:0] aes_input;
    reg [127:0] aes_cipher;
    
    // Declare outputs
    wire [127:0] aes_output;
    
    // Instantiate UUT
    mainAES UUT (
        .clk(clk),
        .aes_input(aes_input),
        .aes_key(aes_key),
        .aes_output(aes_output)
    );
    
    // Clock generation
    always #5 clk = !clk;
    
    initial begin
    
        $display("AES Encryption");
    
        // Assign input and cipher
        aes_input = 128'h0123456789ABCDEF0123456789000000;
        aes_cipher = 128'h0123456789ABCDEF0123456789000000;
        
        $display("Input Value: %h", aes_input);
        $display("Input Cipher Key: %h", aes_cipher);
        
        #1000;
        
        // Display output
        $display("Encrypted message: %h", aes_output);
        
        $finish;
    end
    
endmodule
