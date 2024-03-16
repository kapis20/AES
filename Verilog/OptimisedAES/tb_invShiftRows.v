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


module tb_invShiftRows();
  // Input signals
  reg clk=0;
  reg [7:0] inBits;

  // Output signals
  wire [7:0] outBits;
  wire ready;

  // Instantiate the shiftrows module
  invShiftRows UUT (.clock (clk), .inbyte(inBits), .outbyte(outBits), .ready(ready));

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

  initial begin
    #5
    inBits = 8'b11010100; //d4
    #10
    inBits = 8'b00100111; //bf
    #10
    inBits = 8'b00010001; //5d
    #10
    inBits = 8'b10101110; //30
    
    
    #10
    inBits = 8'b11100000; //e0
    #10
    inBits = 8'b10111111; //b4
    #10
    inBits = 8'b10011000; //52
    #10
    inBits = 8'b11110001; //ae
    
    
    
    
    #10
    inBits = 8'b10111000; //b8
    #10
    inBits = 8'b10110100; //41
    #10
    inBits = 8'b01011101; //11
    #10
    inBits = 8'b11100101; //f1
    
    
    
    
    #10
    inBits = 8'b00011110; //1e
    #10
    inBits = 8'b01000001; //27
    #10
    inBits = 8'b01010010; //98
    #10
    inBits = 8'b00110000; //e5
    
    
    //second matrix
    #10                       
    inBits = 8'b01001001; //49
    #10                       
    inBits = 8'b11011110; //db
    #10                       
    inBits = 8'b11010010; //87
    #10                       
    inBits = 8'b10001001; //3b
    
    
     #10                       
     inBits = 8'b01000101; //45
     #10                       
     inBits = 8'b11011011; //39
     #10                       
     inBits = 8'b10010110; //53
     #10                       
     inBits = 8'b11110001; //89
    
    
     #10                       
     inBits = 8'b01111111; //7f
     #10                       
     inBits = 8'b00111001; //02
     #10                       
     inBits = 8'b10000111; //d2
     #10                       
     inBits = 8'b00011010; //f1
     
     #10                       
     inBits = 8'b01110111; //77
     #10                       
     inBits = 8'b00000010; //de
     #10                       
     inBits = 8'b01010011; //96
     #10                       
     inBits = 8'b00111011; //1a
    
    
    #150
    $finish;
  end
endmodule