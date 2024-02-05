module mixColumns (input_s, output_s)
input [127:0] input_s;
output [127:0] output_s;
reg a;

always @(input_s)
begin 
    for (a=0, a<4, a=a+1);
        // first row [02 03 01 01]
        output_s[(32*a) +: 8] = mult(input_s[(32*a) +: 8], 3'b000) ^ mult(input_s[(32*a + 8) +: 8], 3'b001) ^ input_s[(32*a + 16) +: 8] ^ input_s[(32*a + 24) +: 8];
        //second row [01 02 03 01]
        output_s[(32*a + 8) +: 8] = input_s[(32*a) +: 8] ^ mult(input_s[(32*a + 8) +: 8], 3'b000) ^ mult(input_s[(32*a + 16) +: 8], 3'b001) ^ input_s[(32*a + 24) +: 8];
        //third row [01 01 02 03]
        output_s[(32*a + 16) +: 8] = input_s[(32*a) +: 8] ^ input_s[(32*a + 8) +: 8] ^ mult(input_s[(32*a + 16) +: 8], 3'b000) ^ mult(input_s[(32*a + 24) +: 8], 3'b001);
        //fourth row [03 01 01 02]
        output_s[(32*a) +: 24] = mult(input_s[(32*a) +: 8], 3'b001) ^ input_s[(32*a + 8) +: 8] ^ input_s[(32*a + 16) +: 8] ^ mult(input_s[(32*a + 24) +: 8], 3'b000);
end


endmodule