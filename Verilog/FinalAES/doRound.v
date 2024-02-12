`timescale 1ns / 1ps

// Module that details that steps of each round
// Module written and tested by C. Baldwin
module doRound(
    clk,
    data_in,
    key_in,
    data_out
    );
    
    // Declare inputs and outputs
    // Inputs: clock, the data and the round key
    // Outputs: Output data from the round
    input clk;
    input [127:0] data_in;
    input [127:0] key_in;
    output [127:0] data_out;
    
    // Other variables - these wires hold the outputs from each stage of the round
    wire [127:0] subbytes_data;
    wire [127:0] shiftrows_data;
    wire [127:0] mixcoloumns_data;
    wire [255:0] tempout;
    
    // Logic for each round
    SubBytes step_1(data_in, subbytes_data);
    shiftRows step_2(clk, subbytes_data, shiftrows_data);
    mixColumns step_3(clk, shiftrows_data, mixcoloumns_data, tempout);
    assign data_out = mixcoloumns_data^key_in;
    
endmodule
