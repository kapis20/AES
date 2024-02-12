`timescale 1ns/1ps
//Written by B K Teo

//This module handles multiplication for 02, 03, 09, 0B, 0D and 0E
//The multiplier value in the input is used to select the case statement to decide which of the 6 values is used as multiplier

module mult (multiplicand, clock, multiplier, product);

input[7:0] multiplicand;
input[2:0] multiplier; //there are 6 options in total. So 3 bits
input clock;
output reg  [7:0] product;


// Temporary variables to store the inbtermediate result of 2^2 and 2^3
reg [7:0] mult4;
reg [7:0] mult8;

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

always @(posedge clock)
    case (multiplier)
    //mult 2
    3'b000: begin 
                product = mult2(multiplicand);
            end 
            
            
    //mult 3
    //Multiply by 3 = multiply by (2+1). So it will first multiply by 2 then add (XOR) the original input
    3'b001: begin 
                product = mult2(multiplicand) ^ multiplicand;
            end 
            
            
    //mult 09
    //Multiply by 9 = multiply by (8+1) = (2^3) + 1
    //It will multiply input by 2 three times to get 2^3 and store it in mult8
    //It will then XOR (add) mult8 and the original input
    3'b010: begin 
                mult8 = multiplicand;
                for (i=0; i<3; i=i+1)begin
                    mult8 = mult2(mult8);
                end
                    product = mult8 ^ multiplicand;
            end 


    //mult 0B
    //Multiply by 0B = multiply by (8+2+1) = (2^3) + 2 + 1
    //It will multiply input by 2 three times to get 2^3 and store it in mult8
    //It will then XOR (add) mult8, the original input after it is multiplied by 2 and the original input
    3'b011: begin 
                mult8 = multiplicand;
                for (i=0; i<3; i=i+1) begin
                    mult8 = mult2(mult8);
                end
                product = multiplicand ^ mult2(multiplicand) ^ mult8;
            end 


    //mult 0D
    //Multiply by 0D = multiply by (8+4+1) = (2^3) + (2^2) + 1
    //It will multiply input by 2 two times to get 2^2 and store it in mult4
    //It will multiply input by 2 three times to get 2^3 and store it in mult8
    //It will then XOR (add) mult8, mult4 and the original input 
    3'b100: begin 
                mult8 = multiplicand;
                mult4 = multiplicand;
                for (i=0; i<3; i=i+1) begin
                mult8 = mult2(mult8);
                end
                for (i=0; i<2; i=i+1) begin
                mult4 = mult2(mult4);
                end

                product = multiplicand ^ mult4 ^ mult8;
            end 


    //mult 0E
    //Multiply by 0D = multiply by (8+4+2) = (2^3) + (2^2) + (2)
    //It will multiply input by 2 two times to get 2^2 and store it in mult4
    //It will multiply input by 2 three times to get 2^3 and store it in mult8
    //It will then XOR (add) mult8, mult4 and the original input after it is multiplied by 2
    3'b101: begin 
                mult8 = multiplicand;
                mult4 = multiplicand;
                for (i=0; i<3; i=i+1) begin
                mult8 = mult2(mult8);
                end
                for (i=0; i<2; i=i+1) begin
                mult4 = mult2(mult4);
                end

                product = mult2(multiplicand) ^ mult4 ^ mult8;
            end

    endcase


endmodule
