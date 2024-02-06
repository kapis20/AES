`timescale 1ns / 1ps

module invMixColumns (input_s, clk, output_s, ready);
input [127:0] input_s;
input clk;
output [127:0] output_s;
output ready;


reg[127:0] TempOut;    //Intermediate register to store the output from mult module to be used for the XOR  
integer a = 0; //Counter



//This always block will do 1 column every clock cycle and will take 4 cycles before ready == 1
always @(posedge clk) begin 

    //set ready = 1 after 4 cycles
    if (a==4)
        ready = 1'b1; 
    else begin

        //Calculating the terms that need multiplication (by 09, 0b, 0d or 0e) by passing them to multiplier module
        //Results are stored in TempOut
        //passing 3'b010 in multiplier for 09 multiplication
        //Passing 3'b011 in multiplier for 0b multiplication
        //passing 3'b100 in multiplier for 0d multiplication
        //Passing 3'b101 in multiplier for 0e multiplication

        //terms for the first row 
        mult inst_1(.multiplicand(input_s[(32*a) +: 8]), .multiplier(3'b101), .product(TempOut[127:120]), .clock(clk));
        mult inst_2(.multiplicand(input_s[(32*a + 8) +: 8]), .multiplier(3'b011), .product(TempOut[119:112]), .clock(clk));
        mult inst_3(.multiplicand(input_s[(32*a + 16) +: 8]), .multiplier(3'b100), .product(TempOut[111:104]), .clock(clk));
        mult inst_4(.multiplicand(input_s[(32*a + 24) +: 8]), .multiplier(3'b010), .product(TempOut[103:96]), .clock(clk));

        //terms for the second row
        mult inst_5(.multiplicand(input_s[(32*a) +: 8]), .multiplier(3'b010), .product(TempOut[95:88]), .clock(clk));
        mult inst_6(.multiplicand(input_s[(32*a + 8) +: 8]), .multiplier(3'b101), .product(TempOut[87:80]), .clock(clk));
        mult inst_7(.multiplicand(input_s[(32*a + 16) +: 8]), .multiplier(3'b011), .product(TempOut[79:72]), .clock(clk));
        mult inst_8(.multiplicand(input_s[(32*a + 24) +: 8]), .multiplier(3'b100), .product(TempOut[71:64]), .clock(clk));

        //terms for the third row
        mult inst_9(.multiplicand(input_s[(32*a) +: 8]), .multiplier(3'b100), .product(TempOut[63:56]), .clock(clk));
        mult inst_10(.multiplicand(input_s[(32*a + 8) +: 8]), .multiplier(3'b010), .product(TempOut[55:48]), .clock(clk));
        mult inst_11(.multiplicand(input_s[(32*a + 16) +: 8]), .multiplier(3'b101), .product(TempOut[47:40]), .clock(clk));
        mult inst_12(.multiplicand(input_s[(32*a + 24) +: 8]), .multiplier(3'b011), .product(TempOut[39:32]),.clock(clk));

        //terms for the fourth row
        mult inst_13(.multiplicand(input_s[(32*a) +: 8]), .multiplier(3'b011), .product(TempOut[31:24])), .clock(clk);
        mult inst_14(.multiplicand(input_s[(32*a + 8) +: 8]), .multiplier(3'b100), .product(TempOut[23:16]), .clock(clk));
        mult inst_15(.multiplicand(input_s[(32*a + 16) +: 8]), .multiplier(3'b010), .product(TempOut[15:8]), .clock(clk));
        mult inst_16(.multiplicand(input_s[(32*a + 24) +: 8]), .multiplier(3'b101), .product(TempOut[7:0]), .clock(clk));


        //XOR of the terms to determine the value of each row for that specific column

        //first row [0e 0b 0d 09]
        output_s[(32*a) +: 8] = TempOut[127:120] ^ TempOut[119:112] ^ TempOut[111:104] ^ TempOut[103:96];
        //second row [09 0e 0b 0d]
        output_s[(32*a + 8) +: 8] = TempOut[95:88] ^ TempOut[87:80] ^ TempOut[79:72] ^ TempOut[71:64];
        //third row [0d 09 0e 0b]
        output_s[(32*a + 16) +: 8] = TempOut[63:56] ^ TempOut[55:48] ^ TempOut[47:40] ^ TempOut[39:32];
        //fourth row [0b 0d 09 0e]
        output_s[(32*a) +: 24] = TempOut[31:24] ^ TempOut[23:16] ^ TempOut[15:8] ^ TempOut[7:0];


        //increment counter
        a = a+1;
    end
end


endmodule