`timescale 1ns / 1ps
//Written by B K Teo

// modified by K Sikorski

module mixColumns (input_s, output_s);
input [127:0] input_s;
output reg [127:0] output_s;

reg[63:0] TempOut;
integer a;

always @(input_s) begin 
        for (a=0; a<4; a = a+1) begin
        // first row [02 03 01 01]
        mult instance_1( .multiplicand(input_s[(32 * a) +: 8]), .multiplier(3'b000), .product(TempOut[63:56]));
        mult instance_2( .multiplicand(input_s[(32*a + 8) +: 8]), .multiplier(3'b001), .product(TempOut[55:48]));
        //XOR
           output_s[(32*a) +: 8] = TempOut[63:56] ^TempOut[55:48] ^ input_s[(32*a + 16) +: 8] ^ input_s[(32*a + 24) +: 8];
            //second row [01 02 03 01]
        mult instance_3( .multiplicand(input_s[(32*a) +: 8]), .multiplier(3'b000),.product(TempOut[47:40]));
        mult instance_4( .multiplicand(input_s[(32*a + 16) +: 8]), .multiplier(3'b001),.product(TempOut[39:32]));
        //XOR
            output_s[(32*a + 8) +: 8] = input_s[(32*a) +: 8] ^TempOut[47:40] ^TempOut[39:32] ^ input_s[(32*a + 24) +: 8];
            //third row [01 01 02 03]
        mult instance_5( .multiplicand(input_s[(32*a + 16) +: 8]), .multiplier(3'b000), .product(TempOut[31:24]));
        mult instance_6( .multiplicand(input_s[(32*a + 24) +: 8]), .multiplier(3'b001), .product(TempOut [23:16]));
        //XOR
          output_s[(32*a + 16) +: 8] = input_s[(32*a) +: 8] ^ input_s[(32*a + 8) +: 8] ^TempOut[31:24] ^ TempOut [23:16];
         //fourth row [03 01 01 02]
        mult instance_7( .multiplicand(input_s[(32*a) +: 8]), .multiplier(3'b001), .product(TempOut[15:8]));
        mult instance_8 (.multiplicand(input_s[(32*a + 24) +: 8]), .multiplier(3'b000), .product(TempOut [7:0]));
           //XOR
           output_s[(32*a) +: 24] = TempOut[15:8] ^ input_s[(32*a + 8) +: 8] ^ input_s[(32*a + 16) +: 8] ^ TempOut [7:0];
        end
end 

endmodule