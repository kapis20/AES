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


module tb_encrypt();

reg [7:0] in, key;
reg clock=0;
reg en=0;
//reg ready = 0;

wire [127:0] out;


encrypt UUT(.in(in), .key(key), .clock(clock), .enable(en), .message(out));

// Clock generation
always begin
    #5 clock = ~clock;
  end


initial begin

#5
en = 1'b1;
//ready = 1'b1;

//original key and input
in = 8'b00110010; //32
key = 8'b00101011; //2b

#10
in = 8'b01000011; //43
key = 8'b01111110; //7e

#10
in = 8'b11110110; //f6
key = 8'b00010101; //15

#10
in = 8'b10101000; //a8
key = 8'b00010110; //16



#10
in = 8'b10001000; //88
key = 8'b00101000; //28

#10
in = 8'b01011010; //5a
key = 8'b10101110; //ae

#10
in = 8'b00110000; //30
key = 8'b11010010; //d2

#10
in = 8'b10001101; //8d
key = 8'b10100110; //a6


#10
in = 8'b00110001; //31
key = 8'b10101011; //AB

#10
in = 8'b00110001; //31
key = 8'b11110111; //f7

#10
in = 8'b10011000; //98
key = 8'b00010101; //15

#10
in = 8'b10100010; //a2
key = 8'b10001000; //88



#10
in = 8'b11100000; //e0
key = 8'b00001001; //09

#10
in = 8'b00110111; //37
key = 8'b11001111; //cf

#10
in = 8'b00000111; //07
key = 8'b01001111; //4f

#10
in = 8'b00110100; //34
key = 8'b00111100; //3c


//first round key
#660
key = 8'ha0;

#10
key = 8'hfa;

#10
key = 8'hfe;

#10
key = 8'h17;

#10
key = 8'h88;

#10
key = 8'h54;

#10
key = 8'h2c;

#10
key = 8'hb1;

#10
key = 8'h23;

#10
key = 8'ha3;

#10
key = 8'h39;

#10
key = 8'h39;

#10
key = 8'h2a;

#10
key = 8'h6c;

#10
key = 8'h76;

#10
key = 8'h05;


//round key 2
#660
key = 8'hf2;

#10
key = 8'hc2;

#10
key = 8'h95;

#10
key = 8'hf2;

#10
key = 8'h7a;

#10
key = 8'h96;

#10
key = 8'hb9;

#10
key = 8'h43;

#10
key = 8'h59;

#10
key = 8'h35;

#10
key = 8'h80;

#10
key = 8'h7a;

#10
key = 8'h73;

#10
key = 8'h59;

#10
key = 8'hf6;

#10
key = 8'h7f;


//round key 3
#660
key = 8'h3d;

#10
key = 8'h80;

#10
key = 8'h47;

#10
key = 8'h7d;

#10
key = 8'h47;

#10
key = 8'h16;

#10
key = 8'hfe;

#10
key = 8'h3e;

#10
key = 8'h1e;

#10
key = 8'h23;

#10
key = 8'h7e;

#10
key = 8'h44;

#10
key = 8'h6d;

#10
key = 8'h7a;

#10
key = 8'h88;

#10
key = 8'h3b;


//round key 4
#660
key = 8'hef;

#10
key = 8'h44;

#10
key = 8'ha5;

#10
key = 8'h41;

#10
key = 8'ha8;

#10
key = 8'h52;

#10
key = 8'h5b;

#10
key = 8'h7f;

#10
key = 8'hb6;

#10
key = 8'h71;

#10
key = 8'h25;

#10
key = 8'h3b;

#10
key = 8'hdb;

#10
key = 8'h0b;

#10
key = 8'had;

#10
key = 8'h00;

//round key 5
#660
key = 8'hd4;

#10
key = 8'hd1;

#10
key = 8'hc6;

#10
key = 8'hf8;

#10
key = 8'h7c;

#10
key = 8'h83;

#10
key = 8'h9d;

#10
key = 8'h87;

#10
key = 8'hca;

#10
key = 8'hf2;

#10
key = 8'hb8;

#10
key = 8'hbc;

#10
key = 8'h11;

#10
key = 8'hf9;

#10
key = 8'h15;

#10
key = 8'hbc;

//round key 6
#660
key = 8'h6d;

#10
key = 8'h88;

#10
key = 8'ha3;

#10
key = 8'h7a;

#10
key = 8'h11;

#10
key = 8'h0b;

#10
key = 8'h3e;

#10
key = 8'hfd;

#10
key = 8'hdb;

#10
key = 8'hf9;

#10
key = 8'h86;

#10
key = 8'h41;

#10
key = 8'hca;

#10
key = 8'h00;

#10
key = 8'h93;

#10
key = 8'hfd;

//round key 7
#660
key = 8'h4e;

#10
key = 8'h54;

#10
key = 8'hf7;

#10
key = 8'h0e;

#10
key = 8'h5f;

#10
key = 8'h5f;

#10
key = 8'hc9;

#10
key = 8'hf3;

#10
key = 8'h84;

#10
key = 8'ha6;

#10
key = 8'h4f;

#10
key = 8'hb2;

#10
key = 8'h4e;

#10
key = 8'ha6;

#10
key = 8'hdc;

#10
key = 8'h4f;

//round key 8
#660
key = 8'hea;

#10
key = 8'hd2;

#10
key = 8'h73;

#10
key = 8'h21;

#10
key = 8'hb5;

#10
key = 8'h8d;

#10
key = 8'hba;

#10
key = 8'hd2;

#10
key = 8'h31;

#10
key = 8'h2b;

#10
key = 8'hf5;

#10
key = 8'h60;

#10
key = 8'h7f;

#10
key = 8'h8d;

#10
key = 8'h29;

#10
key = 8'h2f;

//round key 9
#660
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

//round key 10
#460
key = 8'hd0;

#10
key = 8'h14;

#10
key = 8'hf9;

#10
key = 8'ha8;

#10
key = 8'hc9;

#10
key = 8'hee;

#10
key = 8'h25;

#10
key = 8'h89;

#10
key = 8'he1;

#10
key = 8'h3f;

#10
key = 8'h0c;

#10
key = 8'hc8;

#10
key = 8'hb6;

#10
key = 8'h63;

#10
key = 8'h0c;

#10
key = 8'ha6;

#10
$finish;

end
endmodule
