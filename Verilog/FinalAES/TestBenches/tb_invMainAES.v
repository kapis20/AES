`timescale 1ns / 1ps

// Testbench that allows for data and key input, and produces a decrypted output
// Written by C. Baldwin
module tb_invMainAES;
    
    // Declare inputs
    reg clk = 0;
    reg [127:0] aes_input = 128'hAA37C40FD7AF4E231219DFB1377E0D7C;
    reg [127:0] aes_key= 128'hA4F13C6860DB2535164FDF944C8D3D8A;
    
    // Declare outputs
    wire [127:0] aes_output;
    
    // Instantiate UUT
    invMainAES UUT (
        .clk(clk),
        .aes_input(aes_input),
        .aes_key(aes_key),
        .aes_output(aes_output)
    );
    
    // Clock generation
    always #5 clk = !clk;
    
    initial begin
    
        $display("AES Decryption");
        
        $display("Input Value: %h", aes_input);
        $display("Input Cipher Key: %h", aes_key);
        
        #1000;
        
        // Display output
        $display("Decrypted message: %h", aes_output);
        
        $finish;
    end
    
endmodule
