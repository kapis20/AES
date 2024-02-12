`timescale 1ns / 1ps

// Module that details that steps of each round
// Module written and tested by C. Baldwin
module doInvRound(
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
    wire [127:0] mixcolumns_data;
    wire [511:0] tempout;
    
    // Logic for each round
    invShiftRows step_1(clk, data_in, shiftrows_data);
    Inv_SubBytes step_2(shiftrows_data, subbytes_data);
    InvMixColumns step_3(clk, (subbytes_data^key_in), mixcolumns_data, tempout);
    assign data_out = mixcolumns_data;
    
endmodule
