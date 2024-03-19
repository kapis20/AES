`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Boon Kean Teo
// Module Name: invMixColumns
// Project Name: AES (EEE6225)
// Description: This module will perform inverse Mix Columns for the AES. It has a latency of 12 cycles and a throuhgput of 1 after.  
//////////////////////////////////////////////////////////////////////////////////

module invMixColumns(in_byte, ready, clock, enable, out_byte);

//declaring inputs and outputs of the module
input [7:0] in_byte;
input [7:0] enable;
input clock, ready;
output reg [7:0] out_byte=0;

//intermediate registers to implement the cyclic shift registers
reg [7:0] out_byte_1=8'b00000000;
reg [7:0] out_byte_2=8'b00000000;
reg [7:0] out_byte_3=8'b00000000;
reg [7:0] out_byte_4=8'b00000000;

//Counter and temporary registers
reg [7:0] temp;
reg [3:0] counter = 0;
reg [23:0] temp2 = 0;

// Temporary variables to store the intermediate result of 2^2 and 2^3
reg [7:0] mult4;
reg [7:0] mult8;

//Counter for the functions to keep track of how many times it needs to call mult 2 depending on the power of 2
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
    out_byte_4 = multE(in_byte) ^ temp;
    
    //only increment counter when enable = 1
    if (ready == 1)begin
    counter = counter + 1'b1;
    end else begin
    counter = counter;
    end
   
  
    
    //When counter reaches 4, it means that the output is ready in each of the 4 out_byte registers.
    //The first out_byte_1 register is assigned to the output while the others are stored in temp2 and assigned to output in subsequent clock cycles
    if (counter == 4)begin
    out_byte = out_byte_1;
    end else if (counter == 5)begin
    out_byte = temp2[23:16];
    end else if (counter == 6) begin
    out_byte = temp2[15:8];
    end else if (counter == 7) begin
    out_byte = temp2[7:0];
    end else if (counter == 8) begin
    counter = 4;
    out_byte = out_byte_1;
    end
    
    //Storing out_byte registers 2,3 and 4 in temp2 when counter is 4
    if(counter == 4)begin
    //temp2[31:24] <= out_byte_1;
    temp2[23:16] <= out_byte_2;
    temp2[15:8] <= out_byte_3;
    temp2[7:0] <= out_byte_4;
    end
    
   
    
end


endmodule
