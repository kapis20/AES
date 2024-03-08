`timescale 1ns / 1ps

module mixColumns_v1(in_byte, clock, enable, out_byte_1, out_byte_2, out_byte_3, out_byte_4);


input [7:0] in_byte;
input [7:0] enable;
input clock;
output reg [7:0] out_byte_1=8'b00000000;
output reg [7:0] out_byte_2=8'b00000000;
output reg [7:0] out_byte_3=8'b00000000;
output reg [7:0] out_byte_4=8'b00000000;

reg [7:0] test1;
reg [7:0] test2;
reg [7:0] test3;
reg [7:0] test4;
reg [7:0] test5;
reg [7:0] test6;


//This function multiples the input by 2
function [7:0] mult2;
input [7:0] num;
begin
    if (num [7] == 1) 
        mult2 = (num << 1) ^ 8'h1b;
    else 
        mult2 = num << 1;
end
endfunction

//This function multiplies the input by 3
function [7:0] mult3;
input [7:0] num;
begin
    mult3 = mult2(num) ^ num;
end 
endfunction


always @(posedge clock) begin
    //blocking assigment is used to ensure that all the old register values are used to determine the new ones
    //test1 = out_byte_2 & enable;
    //test2 = out_byte_3 & enable;
    //test3 = out_byte_4 & enable;
    //test5 = mult2(in_byte);
    //test6 = mult3(in_byte);
    test4 = out_byte_1 & enable;
    
    out_byte_1 = in_byte ^ (out_byte_2 & enable);
    out_byte_2 = in_byte ^ (out_byte_3 & enable);
    out_byte_3 = mult3(in_byte) ^ (out_byte_4 & enable);
    //out_byte_4 = mult2(in_byte) ^ (out_byte_1 & enable);
    out_byte_4 = mult2(in_byte) ^ test4;
    
    

end 


endmodule
