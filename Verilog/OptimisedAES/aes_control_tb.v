`timescale 1ns/1ns

module key_expansion_control_tb;
    reg rst;
    reg clk;
    reg [7:0] input_key;
    reg [127:0] input_MixCol;
    wire [127:0] output_key128;
    //wire [3:0] round;
   
    parameter kin = 128'h2b7e151628aed2a6abf7158809cf4f3c;
    key_expansion_control test (rst, clk, input_key,input_MixCol, output_key128);

    always #5 begin
        clk = !clk;
    end
    
    initial begin
        
        rst = 1'b1;
        clk = 1'b1;
        
        #10
        rst = 1'b0;
        input_key = kin[127:120];
        input_MixCol = kin[127:0];

        #10
        input_key = kin[119:112];

        #10
        input_key = kin[111:104];

        #10
        input_key = kin[103:96];

        #10
        input_key = kin[95:88];

        #10
        input_key = kin[87:80];

        #10
        input_key = kin[79:72];

        #10
        input_key = kin[71:64];

        #10
        input_key = kin[63:56];
        
        #10
        input_key = kin[55:48];
        
        #10
        input_key = kin[47:40];

        #10
        input_key = kin[39:32];

        #10
        input_key = kin[31:24];

        #10
        input_key = kin[23:16];

        #10
        input_key = kin[15:8];

        #10
        input_key = kin[7:0];
    end
endmodule