`timescale 1ns / 1ps

/*module mixColumns(in_byte, clock, enable, out_byte_1, out_byte_2, out_byte_3, out_byte_4);
input [7:0] in_byte;
input [7:0] enable;
input clock;*/

module mixColumns(in_byte, clock, enable, out_byte);


input [7:0] in_byte;
input [7:0] enable;
input clock;
output reg [7:0] out_byte=0;

//intermediate registers
reg [7:0] out_byte_1=8'b00000000;
reg [7:0] out_byte_2=8'b00000000;
reg [7:0] out_byte_3=8'b00000000;
reg [7:0] out_byte_4=8'b00000000;

reg [7:0] temp;
reg [3:0] counter = 0;
reg [23:0] temp2 = 0;


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
    temp = out_byte_1 & enable;
    
    out_byte_1 = in_byte ^ (out_byte_2 & enable);
    out_byte_2 = in_byte ^ (out_byte_3 & enable);
    out_byte_3 = mult3(in_byte) ^ (out_byte_4 & enable);
    out_byte_4 = mult2(in_byte) ^ temp;
    
    counter = counter + 1;
   
  
    
    
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
    
    
    if(counter == 4)begin
    //temp2[31:24] <= out_byte_1;
    temp2[23:16] <= out_byte_2;
    temp2[15:8] <= out_byte_3;
    temp2[7:0] <= out_byte_4;
    end
    
   
    
end


/*output reg [7:0] out_byte_1=8'b00000000;
output reg [7:0] out_byte_2=8'b00000000;
output reg [7:0] out_byte_3=8'b00000000;
output reg [7:0] out_byte_4=8'b00000000;

reg [7:0] temp;
reg [3:0] counter = 0;
reg [31:0] temp2 = 0;
reg [7:0] test = 0;

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
    temp = out_byte_1 & enable;
    
    out_byte_1 = in_byte ^ (out_byte_2 & enable);
    out_byte_2 = in_byte ^ (out_byte_3 & enable);
    out_byte_3 = mult3(in_byte) ^ (out_byte_4 & enable);
    out_byte_4 = mult2(in_byte) ^ temp;
    
    counter = counter + 1;
   
  
    
    
    if (counter == 4)begin
    test = out_byte_1;
    end else if (counter == 5)begin
    test = temp2[23:16];
    end else if (counter == 6) begin
    test = temp2[15:8];
    end else if (counter == 7) begin
    test = temp2[7:0];
    end else if (counter == 8) begin
    counter = 4;
    test = out_byte_1;
    end
    
    
    if(counter == 4)begin
    temp2[31:24] <= out_byte_1;
    temp2[23:16] <= out_byte_2;
    temp2[15:8] <= out_byte_3;
    temp2[7:0] <= out_byte_4;
    end
    
   
    
end*/










endmodule