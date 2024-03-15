`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 23:18:33
// Design Name: 
// Module Name: tb_shiftrows
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_shiftrows();
  // Input signals
  reg clk=0;
  reg [7:0] inBits;

  // Output signals
  wire [7:0] outBits;
  wire ready;

  // Instantiate the shiftrows module
  shiftrows UUT (clk, inBits, outBits, ready);

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  initial begin
    #10
    inBits = 8'b11010100;
    #10
    inBits = 8'b00100111;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;
    #10
    inBits = 8'b01010101;


    #10 inBits = 8'b10101010;
    #10 inBits = 8'b00000000;


    #100;
    $finish;
  end

  // Monitor signals
  always @(posedge clk) begin
    if (ready) begin
      $display("Input:  %b, Output: %b", inBits, outBits);
    end
  end
endmodule
