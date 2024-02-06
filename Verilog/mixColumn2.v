`timescale 1ns / 1ps

module mixColumns (input_s, clk, output_s, ready);
input [127:0] input_s;
input clk;
output reg [127:0] output_s;
output ready;

reg[63:0] TempOut;    //Intermediate register to store the output from mult module to be used for the XOR  
integer a = 0; //Counter


//This always block will do 1 column every clock cycle and will take 4 cycles before ready == 1
always @(posedge clk) begin 

    //set ready = 1 after 4 cycles
    if (a==4)
        ready = 1'b1; 
    else begin

        //calculating the terms that need multiplication (by 02 or 03) by passing them to multiplier module.
        //results are stored in TempOut
        //passing 3'b000 in multiplier for 02 multiplication and passing 3'b001 for 03 multiplication

        //terms for the first row
        mult instance_1( .multiplicand(input_s[(32 * a) +: 8]), .multiplier(3'b000), .product(TempOut[63:56]), .clock(clk));
        mult instance_2( .multiplicand(input_s[(32*a + 8) +: 8]), .multiplier(3'b001), .product(TempOut[55:48]), .clock(clk));  
        //terms for the second row
        mult instance_3( .multiplicand(input_s[(32*a) +: 8]), .multiplier(3'b000),.product(TempOut[47:40]), .clock(clk));
        mult instance_4( .multiplicand(input_s[(32*a + 16) +: 8]), .multiplier(3'b001),.product(TempOut[39:32]), .clock(clk));
        //terms for the third row
        mult instance_5( .multiplicand(input_s[(32*a + 16) +: 8]), .multiplier(3'b000), .product(TempOut[31:24]), .clock(clk));
        mult instance_6( .multiplicand(input_s[(32*a + 24) +: 8]), .multiplier(3'b001), .product(TempOut [23:16]), .clock(clk));
        //terms for the fourth row
        mult instance_7( .multiplicand(input_s[(32*a) +: 8]), .multiplier(3'b001), .product(TempOut[15:8]), .clock(clk));
        mult instance_8 (.multiplicand(input_s[(32*a + 24) +: 8]), .multiplier(3'b000), .product(TempOut [7:0]), .clock(clk));


        //XOR of the terms to determine the value of each row for that specific column

        //First row [02 03 01 01]
        output_s[(32*a) +: 8] = TempOut[63:56] ^TempOut[55:48] ^ input_s[(32*a + 16) +: 8] ^ input_s[(32*a + 24) +: 8];

        //second row [01 02 03 01]
        output_s[(32*a + 8) +: 8] = input_s[(32*a) +: 8] ^TempOut[47:40] ^TempOut[39:32] ^ input_s[(32*a + 24) +: 8];

        //third row [01 01 02 03]
        output_s[(32*a + 16) +: 8] = input_s[(32*a) +: 8] ^ input_s[(32*a + 8) +: 8] ^TempOut[31:24] ^ TempOut [23:16];

        //fourth row [03 01 01 02]
        output_s[(32*a) +: 24] = TempOut[15:8] ^ input_s[(32*a + 8) +: 8] ^ input_s[(32*a + 16) +: 8] ^ TempOut [7:0];


        //increment counter
        a = a+1;
    end
end 

endmodule