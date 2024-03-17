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


module tb_decrypt();

reg [7:0] in, key;
reg clock=0;
reg en=0;

wire [127:0] out;


decrypt UUT(.in(in), .key(key), .clock(clock), .enable(en), .message(out));

// Clock generation
always begin
    #5 clock = ~clock;
  end


initial begin

#5
en = 1'b1;

//#20
in = 8'b00110010; //32
key = 8'hd0; //d0

#10
in = 8'b01000011; //43
key = 8'h14; //7e

#10
in = 8'b11110110; //f6
key = 8'hf9; //15

#10
in = 8'b10101000; //a8
key = 8'ha8; //16



#10
in = 8'b10001000; //88
key = 8'hc9; //28

#10
in = 8'b01011010; //5a
key = 8'hee; //ae

#10
in = 8'b00110000; //30
key = 8'h25; //d2

#10
in = 8'b10001101; //8d
key = 8'h89; //a6


#10
in = 8'b00110001; //31
key = 8'he1; //AB

#10
in = 8'b00110001; //31
key = 8'h3f; //f7

#10
in = 8'b10011000; //98
key = 8'h0c; //15

#10
in = 8'b10100010; //a2
key = 8'hc8; //88



#10
in = 8'b11100000; //e0
key = 8'hb6; //09

#10
in = 8'b00110111; //37
key = 8'h63; //cf

#10
in = 8'b00000111; //07
key = 8'h0c; //4f

#10
in = 8'b00110100; //34
key = 8'ha6; //3c

#460
key = 8'hac;

#10
key = 8'h77;

#10
key = 8'h66;

#10
key = 8'hf3;

#10
key = 8'h19;

#10
key = 8'hfa;

#10
key = 8'hdc;

#10
key = 8'h21;

#10
key = 8'h28;

#10
key = 8'hd1;

#10
key = 8'h29;

#10
key = 8'h41;

#10
key = 8'h57;

#10
key = 8'h5c;

#10
key = 8'h00;

#10
key = 8'h6e;


end

endmodule