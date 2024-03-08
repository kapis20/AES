`timescale 1ns / 1ps

module invMixColumns_v1(in_byte, clock, enable, out_byte_1, out_byte_2, out_byte_3, out_byte_4);

input [7:0] in_byte;
input [7:0] enable;
input clock;
output reg [7:0] out_byte_1=8'b00000000;
output reg [7:0] out_byte_2=8'b00000000;
output reg [7:0] out_byte_3=8'b00000000;
output reg [7:0] out_byte_4=8'b00000000;

// Temporary variables to store the inbtermediate result of 2^2 and 2^3
reg [7:0] mult4;
reg [7:0] mult8;

reg [7:0] temp;

//Counter
integer i;

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

//This function multiples the input by 09
//Multiply by 9 = multiply by (8+1) = (2^3) + 1
//It will multiply input by 2 three times to get 2^3 and store it in mult8
//It will then XOR (add) mult8 and the original input
function [7:0] mult9;
input [7:0] num;
begin
    mult8 = num;
    for (i=0; i<3; i=i+1)begin
        mult8 = mult2(mult8);
    end
        mult9 = mult8 ^ num;
end
endfunction


//This function multiples the input by 0B
//Multiply by 0B = multiply by (8+2+1) = (2^3) + 2 + 1
//It will multiply input by 2 three times to get 2^3 and store it in mult8
//It will then XOR (add) mult8, the original input after it is multiplied by 2 and the original input
function [7:0] multB;
input [7:0] num;
begin
    mult8 = num;
    for (i=0; i<3; i=i+1)begin
        mult8 = mult2(mult8);
    end
        multB = mult8 ^ mult2(num) ^ num;
end
endfunction


//This function multiples the input by 0D
//Multiply by 0D = multiply by (8+4+1) = (2^3) + (2^2) + 1
//It will multiply input by 2 two times to get 2^2 and store it in mult4
//It will multiply input by 2 three times to get 2^3 and store it in mult8
//It will then XOR (add) mult8, mult4 and the original input 
function [7:0] multD;
input [7:0] num;
begin
    mult8 = num;
    mult4 = num;
    for (i=0; i<3; i=i+1)begin
        mult8 = mult2(mult8);
    end
    for (i=0; i<2; i=i+1) begin
        mult4 = mult2(mult4);
    end
        multD = mult8 ^ mult4 ^ num;
end
endfunction


//This function multiples the input by 0D
//Multiply by 0D = multiply by (8+4+1) = (2^3) + (2^2) + 1
//It will multiply input by 2 two times to get 2^2 and store it in mult4
//It will multiply input by 2 three times to get 2^3 and store it in mult8
//It will then XOR (add) mult8, mult4 and the original input 
function [7:0] multE;
input [7:0] num;
begin
    mult8 = num;
    mult4 = num;
    for (i=0; i<3; i=i+1)begin
        mult8 = mult2(mult8);
    end
    for (i=0; i<2; i=i+1) begin
        mult4 = mult2(mult4);
    end
        multE = mult8 ^ mult4 ^ mult2(num);
end
endfunction


always @(posedge clock) begin
//blocking assigment is used to ensure that all the old register values are used to determine the new ones

temp = out_byte_1 & enable;

out_byte_1 = mult9(in_byte) ^ (out_byte_2 & enable);
out_byte_2 = multD(in_byte) ^ (out_byte_3 & enable);
out_byte_3 = multB(in_byte) ^ (out_byte_4 & enable);
//out_byte_4 = multE(in_byte) ^ (out_byte_1 & enable);
out_byte_4 = multE(in_byte) ^ temp;

end 




endmodule
