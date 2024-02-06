`timescale 1ns / 1ps
//Written by B K Teo

// modified by K Sikorski

module mixColumns (input_s, output_s);
input [127:0] input_s;
input clk;
output reg [127:0] output_s;

reg[255:0] TempOut;


//always @(input_s) 
//case (input_s)
     
        // first row [02 03 01 01] a = 0
        mult instance_1( .multiplicand(input_s[0:7]), .multiplier(3'b000), .product(TempOut[255:248]));
        mult instance_2( .multiplicand(input_s[8:15]), .multiplier(3'b001), .product(TempOut[247:240]));
        //second row [01 02 03 01] a = 0
        mult instance_3( .multiplicand(input_s[0:7]), .multiplier(3'b000), .product(TempOut[239:232]));
        mult instance_4(.multiplicand(input_s[16:23]), .multiplier(3'b001), .prodcut(TempOut[231: 224]));
        
        //third row [01 01 02 03] a=o
        mult intance_5( .multiplicand(input_s[16:23]), .multiplier(3'b000), .product(TempOut[223 : 216])); 
        mult instance_6(. multiplicand(input_s[24:31]), .multiplier(3'b001), .product(TempOut[215 :208])); 
        
        //fourth row [03 01 01 02] a =0
        mult instance_7 (.multiplicand(input_s[0:7]), . multiplier(3'b001), .product(TempOut [207:200]));
        mult instance_8 (.multiplicand(input_s [24:31]), .multiplier(3'b000), .product(TempOut [199:192]));
        // first row [02 03 01 01] a = 1
        mult instance_9 (.multiplicand(input_s [32:39]), .multiplier(3'b000), .prodcut(TempOut [191:184]));
        mult instance_10(.multiplicand(input_s [40:47]), .multiplier(3'b001), .prodcut(TempOut [183:176]));
        //second row [01 02 03 01] a = 1
        mult instance_11 (.multiplicand(input_s [32:39]), .multiplier(3'b000), .prodcut(TempOut [175:168]));
        mult instance_12 (.multiplicand(input_s [48:55]), .multiplier(3'b001), .product(TempOut [167:160]));
        
         //third row [01 01 02 03] a=1 
         mult instance_13 (.multiplicand(input_s [48:55]), .multiplier(3'b000), .product(TempOut  [159:152]));
         mult instance_14 (. multiplicand(input_s [56:63]), .multiplier(3'b001), .product(TempOut  [151:144]));
         //fourth row [03 01 01 02] a =1
        mult instance_15 (.multiplicand(input_s [32:39]), .multiplier(3'b001), .product(TempOut [143:136]));
        mult instance_16 (.multiplicand(input_s [56:63]), . multiplier(3'b000),.product(TempOut [135:128]));          
        
         // first row [02 03 01 01] a = 2
        mult instance_17 (.multiplicand(input_s [64:71]), .multiplier(3'b000),.product(TempOut [127:120]));
        mult instance_18 (.multiplicand(input_s [72:79]), .multiplier(3'b001),. prodcut(TempOut [119:112]));
        
        //second row [01 02 03 01] a = 2
        mult instance_19 (.multiplicand(input_s [64:71]),.multiplier(3'b000), .product(TempOut [111:104]));
        mult instance_20 (.multiplicand(input_s [80:87]), .multiplier(3'b001), .prodcut(TempOut [103:96]));        
        
        //third row [01 01 02 03] a=2
        mult instance_21 (.multiplicand(input_s [80:87]), .multiplier(3'b000), .product(TempOut [95:88]));
        mult instance_22 (.multiplicand(input_s [88:95]), .multiplier(3'b001), .product(TempOut [87:80]));
        
        //fourth row [03 01 01 02] a =2
        mult instance_23 (.multiplicand(input_s [64:71]), .multiplier(3'b001), .product(TempOut [79:72]));
        mult instance_24 (.multiplicand(input_s [88:95]), .multiplier(3'b000), .product(TempOut [71:64]));
        
        // first row [02 03 01 01] a = 3
        mult instance_25 (.multiplicand(input_s [96:103]),.multiplier(3'b000),.product(TempOut [63:56]));
        mult instance_26 (.multiplicand(input_s [104:111]),.multiplier(3'b001),.product(TempOut [55:48]));
        
         //second row [01 02 03 01] a = 3
        mult instance_27 (.multiplicand(input_s [96:103]), .multiplier(3'b000), .product(TempOut [47:40]));
        mult instance_28 (.multiplicand(input_s [112:119]), .multiplier(3'b001), .product(TempOut [39:32]));    
        
           //third row [01 01 02 03] a=3
        mult instance_29 (.multiplicand(input_s [112:119]), .multiplier(3'b000), .product(TempOut [31:24]));
        mult instance_30 (.multiplicand(input_s [120:127]), .multiplier(3'b001), .product(TempOut [23:16]));
        
          //fourth row [03 01 01 02] a =3
        mult instance_31 (.multiplicand(input_s [96:103]), .multiplier(3'b001), .product(TempOut [15:8]));
        mult instance_32 (.multiplicand(input_s [120:127]), .multiplier(3'b000), .product(TempOut [7:0]));
 
 
 /////////////////////////////////////////////////////////////////////////////////////////////////////   
 
        always @(posedge clk) begin     
        //XOR 1st a = 0
        output_s [0:7] = TempOut[255:248] ^TempOut[247:240] ^input_s[16:23] ^ input_s[24:31];
        // XOR 2nd a = 0
        output_s [8:15] = input_s [0:7] ^TempOut[239:232] ^TempOut[231: 224] ^input_s[24:31];
        // XOR 3rd  a=0 
        outrput_s [16:23] = input_s[0:7] ^ input_s [8:15] ^TempOut[223 : 216] ^TempOut[215 :208];
        // XOR 4th a = 0
        output_s [24:31] = TempOut [207:200] ^input_s [8:15]^ input_s [16:23] ^ TempOut [199:192]; 
        
        
        // XOR 1st a =1 
        output_s [32:39] = TempOut [191:184] ^ TempOut [183:176] ^ input_s[48:55] ^ input_s [56 :63];
        //XOR 2nd a =1 
        output_s [40:47] =input_s [32:39] ^TempOut [175:168] ^TempOut [167:160] ^input_s [56:63];
        // Xor 3rd a =1 
        output_s  [48:55] = input_s [32:39] ^ input_s [40:47] ^TempOut  [159:152] ^TempOut  [151:144];
        //XOR 4th a =1 
        output_s [56:63] =TempOut [143:136]^ input_s [40:47] ^input_s [48:55] ^TempOut [135:128]; 
        
        
        //Xor 1st a=2 
        output_s [64:71] = TempOut [127:120]^TempOut [119:112]^ input_s [80:87] ^ input_s [88:95];
        
        // XOR 2nd a =2 
        output_s [72:79] = input_s [64:71]^ TempOut [111:104] ^TempOut [103:96] ^input_s [88:95];
        
        //XOR 3rd row a =2 
        output_s [80:87] = input_s [64:71]^ input_s [72:79] ^TempOut [95:88] ^TempOut [87:80];
        
        //XOR 4th row a =2 
        output_s [88:95] = TempOut [79:72]^ input_s [72:79] ^ input_s [80:87] ^TempOut [71:64];
        
        //XOR 1st row a = 3
        output_s [96:103] =TempOut [63:56]^TempOut [55:48] ^ input_s [112:119] ^input_s[120:127];
        
        //XOR 2nd row a = 3 
        output_s [104:111] = input_s [96:103] ^TempOut [47:40] ^TempOut [47:40] ^ input_s [120:127];
        
        //XOR 3rd row a =3 
        output_s [112:119] = input_s [96:103] ^ input_s [104:111] ^TempOut [31:24] ^TempOut [23:16];
        //XOR 4th row a = 3 
        output_s [120:127] = TempOut [15:8]^ input_s [104:111] ^ input_s [112:119] ^TempOut [7:0];
        end
endmodule