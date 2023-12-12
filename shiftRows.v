`timescale 1ns / 1ps

module shiftRows(clk, data_in, data_out);

    input clk;
    input [7:0] data_in;
    output reg [7:0] data_out;
    
    always @(posedge clk)
    begin
        assign data_out = {data_in[6:0], data_in[7]};
    end

endmodule
