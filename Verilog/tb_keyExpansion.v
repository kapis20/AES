`timescale 1ns / 1ps

// Testbench which tests functionality of the key expansion algorithm
// Written by C. Baldwin
module tb_keyExpansion;

    // Declare inputs
    // Inputs: clock, cipher key
    // Outputs: the 10 generated keys
    reg clk = 0;
    reg [127:0] input_key = 128'h00112233445566778899aabbccddeeff;
    wire [127:0] r0_key, r1_key, r2_key, r3_key, r4_key, r5_key, r6_key, r7_key, r8_key, r9_key, r10_key;
    
    // Instantiate UUT
    keyExpansion dut(
        .clk(clk),
        .input_key(input_key),
        .r0_key(r0_key),
        .r1_key(r1_key),
        .r2_key(r2_key),
        .r3_key(r3_key),
        .r4_key(r4_key),
        .r5_key(r5_key),
        .r6_key(r6_key),
        .r7_key(r7_key),
        .r8_key(r8_key),
        .r9_key(r9_key),
        .r10_key(r10_key)
    );
    
    // Initialise clock
    always #5 clk = !clk;

    initial begin

    $display("Key Expansion Test");
    #1000
    $display("Key 0: %h", r0_key);
    $display("Key 1: %h", r1_key);
    $display("Key 2: %h", r2_key);
    $display("Key 3: %h", r3_key);
    $display("Key 4: %h", r4_key);
    $display("Key 5: %h", r5_key);
    $display("Key 6: %h", r6_key);
    $display("Key 7: %h", r7_key);
    $display("Key 8: %h", r8_key);
    $display("Key 9: %h", r9_key);
    $display("Key 10: %h", r10_key);

    // Stop simulation
    $finish;
  end

endmodule
