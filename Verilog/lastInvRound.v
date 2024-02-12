`timescale 1ns / 1ps

// Module which calls the last round - not strictly necessary but was included for completeness
// Written and tested by C. Baldwin
module lastInvRound(
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
    invShiftRows step_1(clk, data_in, shiftrows_data);
    Inv_SubBytes step_2(shiftrows_data, subbytes_data);
    assign data_out = subbytes_data^key_in;
    
endmodule
