`timescale 1ns/1ps


module mult (multiplicand, multiplier, product);

input[7:0] multiplicand;
input[3:0] multiplier; //there are 6 options in total. So 3 bits
output reg  [7:0] product;

//assign product = 8'b00000000;

reg [7:0] mult4;
reg [7:0] mult8;
//reg [7:0] temp_product = 8'b00000000; ;

//assign product  = temp_product;
//assign mult4 = multiplicand;
//assign mult8 = multiplicand;

integer i;



function [7:0] mult2;
input [7:0] num;
begin
    if (num [7] == 1) 
        mult2 = (num << 1) ^ 8'h1b;
    else 
        mult2 = num << 1;
end
endfunction

always @(multiplicand or multiplier)
    case (multiplier)
    //mult 2
    3'b000: begin 
                product = mult2(multiplicand);
            end 
    //mult 3
    3'b001: begin 
                product = mult2(multiplicand) ^ multiplicand;
            end 
    //mult 09
    3'b010: begin 
                mult8 = multiplicand;
                for (i=0; i<3; i=i+1)begin
                    mult8 = mult2(mult8);
                end
                    product = mult8 ^ multiplicand;
            end 

    //mult 0B
    3'b011: begin 
                mult8 = multiplicand;
                for (i=0; i<3; i=i+1) begin
                    mult8 = mult2(mult8);
                end
                product = multiplicand ^ mult2(multiplicand) ^ mult8; //Is this okay? Computing mult2 here that will XOR with the ori multiplicand
            end 

    //mult 0D
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
