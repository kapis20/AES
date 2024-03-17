`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2024 16:33:05
// Design Name: 
// Module Name: tb_top
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


module tb_encrypt();

reg [7:0] in, key;
reg clock=0;
reg en=0;

wire [127:0] out;


encrypt UUT(.in(in), .key(key), .clock(clock), .enable(en), .message(out));

// Clock generation
always begin
    #5 clock = ~clock;
  end


initial begin

#5
en = 1'b1;

//#20
in = 8'b00110010; //32
key = 8'b00101011; //2b

#10
in = 8'b01000011; //43
key = 8'b01111110; //7e

#10
in = 8'b11110110; //f6
key = 8'b00010101; //15

#10
in = 8'b10101000; //a8
key = 8'b00010110; //16



#10
in = 8'b10001000; //88
key = 8'b00101000; //28

#10
in = 8'b01011010; //5a
key = 8'b10101110; //ae

#10
in = 8'b00110000; //30
key = 8'b11010010; //d2

#10
in = 8'b10001101; //8d
key = 8'b10100110; //a6


#10
in = 8'b00110001; //31
key = 8'b10101011; //AB

#10
in = 8'b00110001; //31
key = 8'b11110111; //f7

#10
in = 8'b10011000; //98
key = 8'b00010101; //15

#10
in = 8'b10100010; //a2
key = 8'b10001000; //88



#10
in = 8'b11100000; //e0
key = 8'b00001001; //09

#10
in = 8'b00110111; //37
key = 8'b11001111; //cf

#10
in = 8'b00000111; //07
key = 8'b01001111; //4f

#10
in = 8'b00110100; //34
key = 8'b00111100; //3c

end

endmodule
