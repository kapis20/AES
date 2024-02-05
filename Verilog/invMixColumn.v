module invMixColumns (input_s, output_s);

input [127:0] input_s;
output [127:0] output_s;
integer a;

reg [127:0] TempOut;

always @(input_s)
begin 
    for (a=0; a<4; a=a+1)
    
        //Calculate the terms that needs multiplication for first row
        mult inst_1(.multiplicand(input_s[(32*a) +: 8]), .multiplier(3'b101), .product(TempOut[127:120]);
        mult inst_2(.multiplicand(input_s[(32*a + 8) +: 8]), .multiplier(3'b011), .product(TempOut[119:112]);
        mult inst_3(.multiplicand(input_s[(32*a + 16) +: 8]), .multiplier(3'b100), .product(TempOut[111:104]);
        mult inst_4(.multiplicand(input_s[(32*a + 24) +: 8]), .multiplier(3'b010), .product(TempOut[103:96]);
        
        //Calculate the terms that needs multiplication for second row
        mult inst_5(.multiplicand(input_s[(32*a) +: 8]), .multiplier(3'b010), .product(TempOut[95:88]);
        mult inst_6(.multiplicand(input_s[(32*a + 8) +: 8]), .multiplier(3'b101), .product(TempOut[87:80]);
        mult inst_7(.multiplicand(input_s[(32*a + 16) +: 8]), .multiplier(3'b011), .product(TempOut[79:72]);
        mult inst_8(.multiplicand(input_s[(32*a + 24) +: 8]), .multiplier(3'b100), .product(TempOut[71:64]);
        
        //Calculate the terms that needs multiplication for third row
        mult inst_9(.multiplicand(input_s[(32*a) +: 8]), .multiplier(3'b100), .product(TempOut[63:56]);
        mult inst_10(.multiplicand(input_s[(32*a + 8) +: 8]), .multiplier(3'b010), .product(TempOut[55:48]);
        mult inst_11(.multiplicand(input_s[(32*a + 16) +: 8]), .multiplier(3'b101), .product(TempOut[47:40]);
        mult inst_12(.multiplicand(input_s[(32*a + 24) +: 8]), .multiplier(3'b011), .product(TempOut[39:32]);
        
        //Calculate the terms that needs multiplication for fourth row
        mult inst_13(.multiplicand(input_s[(32*a) +: 8]), .multiplier(3'b011), .product(TempOut[31:24]);
        mult inst_14(.multiplicand(input_s[(32*a + 8) +: 8]), .multiplier(3'b100), .product(TempOut[23:16]);
        mult inst_15(.multiplicand(input_s[(32*a + 16) +: 8]), .multiplier(3'b010), .product(TempOut[15:8]);
        mult inst_16(.multiplicand(input_s[(32*a + 24) +: 8]), .multiplier(3'b101), .product(TempOut[7:0]);
        
        
        
        // first row [0e 0b 0d 09]
        output_s[(32*a) +: 8] = TempOut[127:120] ^ TempOut[119:112] ^ TempOut[111:104] ^ TempOut[103:96];
        //second row [09 0e 0b 0d]
        output_s[(32*a + 8) +: 8] = TempOut[95:88] ^ TempOut[87:80] ^ TempOut[79:72] ^ TempOut[71:64];
        //third row [0d 09 0e 0b]
        output_s[(32*a + 16) +: 8] = TempOut[63:56] ^ TempOut[55:48] ^ TempOut[47:40] ^ TempOut[39:32];
        //fourth row [0b 0d 09 0e]
        output_s[(32*a) +: 24] = TempOut[31:24] ^ TempOut[23:16] ^ TempOut[15:8] ^ TempOut[7:0];
end


endmodule