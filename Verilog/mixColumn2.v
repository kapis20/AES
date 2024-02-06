`timescale 1ns / 1ps

module mixColumns (input_s, clk, output_s, ready);
input [127:0] input_s;
input clk;
output reg [127:0] output_s;
output reg ready;

//reg[63:0] TempOut;    

//Intermediate register to store the output from mult module to be used for the XOR 
reg[7:0] TempIn_1;
reg[7:0] TempIn_2;
wire[7:0] TempOut_1;
wire[7:0] TempOut_2;   

//Counter
integer a = 0; 

//Instantiating the mult module
//calculating the terms that need multiplication (by 02 or 03) by passing them to multiplier module.
//results are stored in TempOut
//passing 3'b000 in multiplier for 02 multiplication and passing 3'b001 for 03 multiplication
mult mult_by2( .multiplicand(TempIn_1), .multiplier(3'b000), .product(TempOut_1), .clock(clk));
mult mult_by3( .multiplicand(TempIn_2), .multiplier(3'b001), .product(TempOut_2), .clock(clk));


//This always block will do 1 column every clock cycle and will take 4 cycles before ready == 1
always @(posedge clk) begin 

    //set ready = 1 after 4 cycles
    if (a==4)
        ready = 1'b1; 
    else begin
        
        //compute the first row [02 03 01 01]
        TempIn_1 = input_s[(32 * a) +: 8];
        TempIn_2 = input_s[(32*a + 8) +: 8];
        output_s[(32*a) +: 8] = TempOut_1 ^TempOut_2 ^ input_s[(32*a + 16) +: 8] ^ input_s[(32*a + 24) +: 8];
        
        //compute the second row [01 02 03 01]
        TempIn_1 = input_s[(32*a + 8) +: 8];
        TempIn_2 = input_s[(32*a + 16) +: 8];
        output_s[(32*a + 8) +: 8] = input_s[(32*a) +: 8] ^ TempIn_1 ^ TempIn_2 ^ input_s[(32*a + 24) +: 8];
        
        //compute the third row
        TempIn_1 = input_s[(32 * a + 16) +: 8];
        TempIn_2 = input_s[(32*a + 24) +: 8];
        output_s[(32*a + 16) +: 8] = input_s[(32*a) +: 8] ^ input_s[(32*a + 8) +: 8] ^ TempOut_1 ^ TempOut_2;
        
        //compute the fourth row
        TempIn_1 = input_s[(32 * a + 24) +: 8];
        TempIn_2 = input_s[(32*a) +: 8];
        output_s[(32*a + 24) +: 8] = TempOut_2 ^ input_s[(32*a + 8)] ^ input_s[(32*a + 16) +: 8] ^ TempOut_1;

        //increment counter
        a = a+1;
    end
end 

endmodule