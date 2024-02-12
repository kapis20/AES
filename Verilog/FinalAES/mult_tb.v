`timescale 1ns/1ps
//Written by B K Teo
module mult_tb;

reg [7:0] num;
reg [2:0] mode;
reg clk=0;
wire [7:0] prod;

mult UUT (.multiplicand(num), .multiplier(mode), .product(prod), .clock(clk));

always #5 clk =~clk;

initial begin
    $monitor("The multiplicand is %d, the multiplier is %d and the output is %d", num, mode, prod);

    #100
    num = 8'b11011110;
    mode = 8'b000;

    #100
    num = 8'b10010110;
    mode = 8'b001;

    #100
    num = 8'b11010001;
    mode = 8'b010;

    #100
    num = 8'b11010001;
    mode = 8'b100;

    #100
    num = 8'b11010001;
    mode = 8'b101;

    #100
    num = 8'b11010001;
    mode = 8'b101;


end

endmodule

