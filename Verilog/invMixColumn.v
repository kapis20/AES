module invMixColumns (input_s, output_s);

input [127:0] input_s;
output [127:0] output_s;
reg a;

always @(input_s)
begin 
    for (a=0, a<4, a=a+1);
        // first row [0e 0b 0d 09]
        output_s[(32*a) +: 8] = mult(input_s[(32*a) +: 8], 3'b101) ^ mult(input_s[(32*a + 8) +: 8], 3'b011) ^ mult(input_s[(32*a + 16) +: 8], 3'b100) ^ mult(input_s[(32*a + 24) +: 8], 3'b010);
        //second row [09 0e 0b 0d]
        output_s[(32*a + 8) +: 8] = mult(input_s[(32*a) +: 8], 3'b010) ^ mult(input_s[(32*a + 8) +: 8], 3'b101) ^ mult(input_s[(32*a + 16) +: 8], 3'b011) ^ mult(input_s[(32*a + 24) +: 8], 3'b100);
        //third row [0d 09 0e 0b]
        output_s[(32*a + 16) +: 8] = mult(input_s[(32*a) +: 8], 3'b100) ^ mult(input_s[(32*a + 8) +: 8], 3'b010) ^ mult(input_s[(32*a + 16) +: 8], 3'b101) ^ mult(input_s[(32*a + 24) +: 8], 3'b011);
        //fourth row [0b 0d 09 0e]
        output_s[(32*a) +: 24] = mult(input_s[(32*a) +: 8], 3'b011) ^ mult(input_s[(32*a + 8) +: 8], 3'b100) ^ mult(input_s[(32*a + 16) +: 8], 3'b010) ^ mult(input_s[(32*a + 24) +: 8], 3'b101);
end


endmodule