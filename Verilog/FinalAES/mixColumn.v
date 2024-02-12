`timescale 1ns / 1ps
//Written by B K Teo
// modified by K Sikorski

//This module takes in a 128-bit input and performs mix columns.
//It passes the input values to the multiplier module to be multiplied
//The multiplied values are then XOR to get the final output values

module mixColumns (clk, input_s, output_s, TempOut); 
input [127:0] input_s;
input clk;
output reg [127:0] output_s;
//output reg ready;

output [255:0] TempOut;



        // for output (0,0) 
        mult instance_1(.clock(clk), .multiplicand(input_s[127:120]), .multiplier(3'b000), .product(TempOut[255:248]));
        mult instance_2(.clock(clk), .multiplicand(input_s[119:112]), .multiplier(3'b001), .product(TempOut[247:240]));
        //for output(0,1)
        mult instance_3(.clock(clk), .multiplicand(input_s[119:112]), .multiplier(3'b000), .product(TempOut[239:232]));
        mult instance_4(.clock(clk),.multiplicand(input_s[111:104]), .multiplier(3'b001), .product(TempOut[231: 224]));
        
        //for output (0,2)
        mult intance_5( .clock(clk),.multiplicand(input_s[111:104]), .multiplier(3'b000), .product(TempOut[223 : 216])); 
        mult instance_6(.clock(clk),. multiplicand(input_s[103:96]), .multiplier(3'b001), .product(TempOut[215 :208])); 
        
        // for output (0,3)
        mult instance_7 (.clock(clk),.multiplicand(input_s[127:120]), . multiplier(3'b001), .product(TempOut [207:200]));
        mult instance_8 (.clock(clk),.multiplicand(input_s [103:96]), .multiplier(3'b000), .product(TempOut [199:192]));
        // for output (1,0)
        mult instance_9 (.clock(clk),.multiplicand(input_s [95:88]), .multiplier(3'b000), .product(TempOut [191:184]));
        mult instance_10(.clock(clk),.multiplicand(input_s [87:80]), .multiplier(3'b001), .product(TempOut [183:176]));
        //output (1,1)
        mult instance_11 (.clock(clk),.multiplicand(input_s [87:80]), .multiplier(3'b000), .product(TempOut [175:168]));
        mult instance_12 (.clock(clk),.multiplicand(input_s [79:72]), .multiplier(3'b001), .product(TempOut [167:160]));
        
         //output (1,2)
         mult instance_13 (.clock(clk),.multiplicand(input_s [79:72]), .multiplier(3'b000), .product(TempOut  [159:152]));
         mult instance_14 (.clock(clk),. multiplicand(input_s [71:64]), .multiplier(3'b001), .product(TempOut  [151:144]));
         //output (1,3)
        mult instance_15 (.clock(clk),.multiplicand(input_s [95:88]), .multiplier(3'b001), .product(TempOut [143:136]));
        mult instance_16 (.clock(clk),.multiplicand(input_s [71:64]), . multiplier(3'b000),.product(TempOut [135:128]));          
        
         // output (2,0)
        mult instance_17 (.clock(clk),.multiplicand(input_s [63:56]), .multiplier(3'b000),.product(TempOut [127:120]));
        mult instance_18 (.clock(clk),.multiplicand(input_s [55:48]), .multiplier(3'b001),. product(TempOut [119:112]));
        
        //output (2,1)
        mult instance_19 (.clock(clk),.multiplicand(input_s [55:48]),.multiplier(3'b000), .product(TempOut [111:104]));
        mult instance_20 (.clock(clk),.multiplicand(input_s [47:40]), .multiplier(3'b001), .product(TempOut [103:96]));        
        
        //output(2,2)
        mult instance_21 (.clock(clk),.multiplicand(input_s [47:40]), .multiplier(3'b000), .product(TempOut [95:88]));
        mult instance_22 (.clock(clk),.multiplicand(input_s [39:32]), .multiplier(3'b001), .product(TempOut [87:80]));
        
        // output (2,3)
        mult instance_23 (.clock(clk),.multiplicand(input_s [63:56]), .multiplier(3'b001), .product(TempOut [79:72]));
        mult instance_24 (.clock(clk),.multiplicand(input_s [39:32]), .multiplier(3'b000), .product(TempOut [71:64]));
        
        //output (3,0)
        mult instance_25 (.clock(clk),.multiplicand(input_s [31:24]),.multiplier(3'b000),.product(TempOut [63:56]));
        mult instance_26 (.clock(clk),.multiplicand(input_s [23:16]),.multiplier(3'b001),.product(TempOut [55:48]));
        
         // output (3,1)
        mult instance_27 (.clock(clk),.multiplicand(input_s [23:16]), .multiplier(3'b000), .product(TempOut [47:40]));
        mult instance_28 (.clock(clk),.multiplicand(input_s [15:8]), .multiplier(3'b001), .product(TempOut [39:32]));    
        
           //output (3,2)
        mult instance_29 (.clock(clk),.multiplicand(input_s [15:8]), .multiplier(3'b000), .product(TempOut [31:24]));
        mult instance_30 (.clock(clk),.multiplicand(input_s [7:0]), .multiplier(3'b001), .product(TempOut [23:16]));
        
          //output(3,3)
        mult instance_31 (.clock(clk),.multiplicand(input_s [31:24]), .multiplier(3'b001), .product(TempOut [15:8]));
        mult instance_32 (.clock(clk),.multiplicand(input_s [7:0]), .multiplier(3'b000), .product(TempOut [7:0]));
 
 
 /////////////////////////////////////////////////////////////////////////////////////////////////////   
 
        always @(posedge clk) begin     
        //First column (0,0)
        output_s [127:120] = TempOut[255:248] ^TempOut[247:240] ^input_s[111:104] ^ input_s[103:96];
      //First column (0,1)
        output_s [119:112] = input_s [127:120] ^TempOut[239:232] ^TempOut[231: 224] ^input_s[103:96];
        // Output (0,2)
       output_s [111:104] = input_s[127:120] ^ input_s [119:112] ^TempOut[223 : 216] ^TempOut[215 :208];
        // (0,3)
        output_s [103:96] = TempOut [207:200] ^input_s [119:112]^ input_s [111:104] ^ TempOut [199:192]; 
        
        
        // (1,0)
        output_s [95:88] = TempOut [191:184] ^ TempOut [183:176] ^ input_s[79:72] ^ input_s [71 :64];
        //(1,1)
        output_s [87:80] =input_s [95:88] ^TempOut [175:168] ^TempOut [167:160] ^input_s [71:64];
        // (1,2)
        output_s  [79:72] = input_s [95:88] ^ input_s [87:80] ^TempOut  [159:152] ^TempOut  [151:144];
        //(1,3)
        output_s [71:64] =TempOut [143:136]^ input_s [87:80] ^input_s [79:72] ^TempOut [135:128]; 
        
        
        //(2,0)
        output_s [63:56] = TempOut [127:120]^TempOut [119:112]^ input_s [47:40] ^ input_s [39:32];
        
        // (2,1)
        output_s [55:48] = input_s [63:56]^ TempOut [111:104] ^TempOut [103:96] ^input_s [39:32];
        
        //(2,2)
        output_s [47:40] = input_s [63:56]^ input_s [55:48] ^TempOut [95:88] ^TempOut [87:80];
        
        //X(2,3)
        output_s [39:32] = TempOut [79:72]^ input_s [55:48] ^ input_s [47:40] ^TempOut [71:64];
        
        //(3,0)
        output_s [31:24] =TempOut [63:56]^TempOut [55:48] ^ input_s [15:8] ^input_s[7:0];
        
        //(3,1)
        output_s [23:16] = input_s [31:24] ^TempOut [47:40] ^TempOut [39:32] ^ input_s [7:0];
        
        //(2,3)
        output_s [15:8] = input_s [31:24] ^ input_s [23:16] ^TempOut [31:24] ^TempOut [23:16];
        //(3,3)
        output_s [7:0] = TempOut [15:8]^ input_s [23:16] ^ input_s [15:8] ^TempOut [7:0];
        end
endmodule
