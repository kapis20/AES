`timescale 1ns/1ns

module key_expansion_control_tb;
    reg rst;
    reg clk;
    reg [7:0] input_key;
    reg [7:0] input_MixCol;
   // wire [127:0] output_key128;
    //wire [3:0] round;
   
    parameter kin = 128'h2b7e151628aed2a6abf7158809cf4f3c;
    key_expansion_control test (rst, clk, input_key,input_MixCol);

    always #5 begin
        clk = !clk;
    end
    
    initial begin
        
        rst = 1'b1;
        clk = 1'b1;
        
      
        #10
        rst = 1'b0;
        input_key = kin[127:120];
        //input_MixCol = kin[127:0];
        input_MixCol = 8'b00110010;

        #10
        input_key = kin[119:112];
        input_MixCol = 8'b01000011; //43
        
        #10
        input_key = kin[111:104];
        input_MixCol = 8'b11110110; //f6
       
        #10
        input_key = kin[103:96];
         input_MixCol = 8'b10101000; //a8 
       
        #10
        input_key = kin[95:88];
         input_MixCol = 8'b10001000; //88  
        
        #10
        input_key = kin[87:80];
        input_MixCol = 8'b01011010; //5a
        
        #10
        input_key = kin[79:72];
        input_MixCol = 8'b00110000; //30
        
        #10
        input_key = kin[71:64];
        input_MixCol = 8'b10001101; //8d
        
        #10
        input_key = kin[63:56];
        input_MixCol =8'b00110001; //31
        
        #10
        input_key = kin[55:48];
        input_MixCol =8'b00110001; //31
        
        
        #10
        input_key = kin[47:40];
        input_MixCol =8'b10011000; //98
        
        #10
        input_key = kin[39:32];
        input_MixCol =8'b10100010; //a2
        
        
        #10
        input_key = kin[31:24];
        input_MixCol = 8'b11100000; //e0
        
       
        #10
        input_key = kin[23:16];
        input_MixCol = 8'b00110111; //37
        
        
        #10
        input_key = kin[15:8];
        input_MixCol = 8'b00000111; //07
       
        
       
        #10
        input_key = kin[7:0];
         input_MixCol = 8'b00110100; //34
    end
endmodule
