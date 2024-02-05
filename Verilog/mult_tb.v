`timescale 1ns/1ps

module mult ();

reg [7:0] num, prod;
reg [2:0] mode;

mult mul (num, mode, prod);

initial begin
    $monitor("The multiplicand is %d, the multiplier is %d and the output is %d", num, mode, prod);

    #100
    num = 8'b11010001;
    mode = 8'b000;

    #100
    num = 8'b11010001;
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

