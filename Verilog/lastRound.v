`timescale 1ns / 1ps

// Module which calls the last round - not strictly necessary but was included for completeness
// Written and tested by C. Baldwin
module lastRound(
    clk,
    data_in,
    key_in,
    data_out
    );
    
    // Declare inputs and outputs
    // Inputs: clock, input data, round key
    // Outputs: Round output data
    input clk;
    input [127:0] data_in;
    input [127:0] key_in;
    output [127:0] data_out;
    
    // Additional variables - used to store outputs from each step of the round
    wire [127:0] subbytes_data;
    wire [127:0] shiftrows_data;
    wire [255:0] tempout;
    
    // Logic for the final round - misses mix columns
    SubBytes step_1(data_in, subbytes_data);
    shiftRows step_2(clk, subbytes_data, shiftrows_data);
    assign data_out = shiftrows_data^key_in;
    
endmodule
