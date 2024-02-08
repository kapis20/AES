`timescale 1ns / 1ps


//////////////////////////////////////////////////////////////////////////////////


module InvMixColumns(clk, input_s, output_s, TempOut );
input [127:0] input_s;
input clk;
output reg [127:0] output_s;
output [511:0] TempOut;

    // for output (0,0) 
        mult instance_1(.clock(clk), .multiplicand(input_s[127:120]), .multiplier(3'b101), .product(TempOut[511:504]));
        mult instance_2(.clock(clk), .multiplicand(input_s[119:112]), .multiplier(3'b011), .product(TempOut[503:496]));
        mult instance_3(.clock(clk), .multiplicand(input_s[111:104]), .multiplier(3'b100), .product(TempOut[495:488]));
        mult instance_4(.clock(clk), .multiplicand(input_s[103:96]), .multiplier(3'b010), .product(TempOut[487:480]));
        
        // output(1,0)
        mult instance_5(.clock(clk), .multiplicand(input_s[127:120]), .multiplier(3'b010), .product(TempOut[479:472]));
        mult instance_6(.clock(clk), .multiplicand(input_s[119:112]), .multiplier(3'b101), .product(TempOut[471:464]));
        mult instance_7(.clock(clk), .multiplicand(input_s[111:104]), .multiplier(3'b011), .product(TempOut[463:456]));
        mult instance_8(.clock(clk), .multiplicand(input_s[103:96]), .multiplier(3'b100), .product(TempOut[455:448]));
        
        // output(2,0)
        mult instance_9(.clock(clk), .multiplicand(input_s[127:120]), .multiplier(3'b100), .product(TempOut[447:440]));
        mult instance_10(.clock(clk), .multiplicand(input_s[119:112]), .multiplier(3'b010), .product(TempOut[439:432]));
        mult instance_11(.clock(clk), .multiplicand(input_s[111:104]), .multiplier(3'b101), .product(TempOut[431:424]));
        mult instance_12(.clock(clk), .multiplicand(input_s[103:96]), .multiplier(3'b011), .product(TempOut[423:416]));
        
        // output(3,0)
        mult instance_13(.clock(clk), .multiplicand(input_s[127:120]), .multiplier(3'b011), .product(TempOut[415:408]));
        mult instance_14(.clock(clk), .multiplicand(input_s[119:112]), .multiplier(3'b100), .product(TempOut[407:400]));
        mult instance_15(.clock(clk), .multiplicand(input_s[111:104]), .multiplier(3'b010), .product(TempOut[399:392]));
        mult instance_16(.clock(clk), .multiplicand(input_s[103:96]), .multiplier(3'b101), .product(TempOut[391:384]));
        
         // for output (0,1) 
        mult instance_17(.clock(clk), .multiplicand(input_s[95:88]), .multiplier(3'b101), .product(TempOut[383:376]));
        mult instance_18(.clock(clk), .multiplicand(input_s[87:80]), .multiplier(3'b011), .product(TempOut[375:368]));
        mult instance_19(.clock(clk), .multiplicand(input_s[79:72]), .multiplier(3'b100), .product(TempOut[367:360]));
        mult instance_20(.clock(clk), .multiplicand(input_s[71:64]), .multiplier(3'b010), .product(TempOut[359:352]));
        
        // output(1,1)
        mult instance_21(.clock(clk), .multiplicand(input_s[95:88]), .multiplier(3'b010), .product(TempOut[351:344]));
        mult instance_22(.clock(clk), .multiplicand(input_s[87:80]), .multiplier(3'b101), .product(TempOut[343:336]));
        mult instance_23(.clock(clk), .multiplicand(input_s[79:72]), .multiplier(3'b011), .product(TempOut[335:328]));
        mult instance_24(.clock(clk), .multiplicand(input_s[71:64]), .multiplier(3'b100), .product(TempOut[327:320]));
        
        // output(2,1)
        mult instance_25(.clock(clk), .multiplicand(input_s[95:88]), .multiplier(3'b100), .product(TempOut[319:312]));
        mult instance_26(.clock(clk), .multiplicand(input_s[87:80]), .multiplier(3'b010), .product(TempOut[311:304]));
        mult instance_27(.clock(clk), .multiplicand(input_s[79:72]), .multiplier(3'b101), .product(TempOut[303:296]));
        mult instance_28(.clock(clk), .multiplicand(input_s[71:64]), .multiplier(3'b011), .product(TempOut[295:288]));
        
        // output(3,1)
        mult instance_29(.clock(clk), .multiplicand(input_s[95:88]), .multiplier(3'b011), .product(TempOut[287:280]));
        mult instance_30(.clock(clk), .multiplicand(input_s[87:80]), .multiplier(3'b100), .product(TempOut[279:272]));
        mult instance_31(.clock(clk), .multiplicand(input_s[79:72]), .multiplier(3'b010), .product(TempOut[271:264]));
        mult instance_32(.clock(clk), .multiplicand(input_s[71:64]), .multiplier(3'b101), .product(TempOut[263:256]));
        
        // for output (0,2) 
        mult instance_33(.clock(clk), .multiplicand(input_s[63:56]), .multiplier(3'b101), .product(TempOut[255:248]));
        mult instance_34(.clock(clk), .multiplicand(input_s[55:48]), .multiplier(3'b011), .product(TempOut[247:240]));
        mult instance_35(.clock(clk), .multiplicand(input_s[47:40]), .multiplier(3'b100), .product(TempOut[239:232]));
        mult instance_36(.clock(clk), .multiplicand(input_s[39:32]), .multiplier(3'b010), .product(TempOut[231:224]));
        
        // output(1,2)
        mult instance_37(.clock(clk), .multiplicand(input_s[63:56]), .multiplier(3'b010), .product(TempOut[223:216]));
        mult instance_38(.clock(clk), .multiplicand(input_s[55:48]), .multiplier(3'b101), .product(TempOut[215:208]));
        mult instance_39(.clock(clk), .multiplicand(input_s[47:40]), .multiplier(3'b011), .product(TempOut[207:200]));
        mult instance_40(.clock(clk), .multiplicand(input_s[39:32]), .multiplier(3'b100), .product(TempOut[199:192]));
        
        // output(2,2)
        mult instance_41(.clock(clk), .multiplicand(input_s[63:56]), .multiplier(3'b100), .product(TempOut[191:184]));
        mult instance_42(.clock(clk), .multiplicand(input_s[55:48]), .multiplier(3'b010), .product(TempOut[183:176]));
        mult instance_43(.clock(clk), .multiplicand(input_s[47:40]), .multiplier(3'b101), .product(TempOut[175:168]));
        mult instance_44(.clock(clk), .multiplicand(input_s[39:32]), .multiplier(3'b011), .product(TempOut[167:160]));
        
        // output(3,2)
        mult instance_45(.clock(clk), .multiplicand(input_s[63:56]), .multiplier(3'b011), .product(TempOut[159:152]));
        mult instance_46(.clock(clk), .multiplicand(input_s[55:48]), .multiplier(3'b100), .product(TempOut[151:144]));
        mult instance_47(.clock(clk), .multiplicand(input_s[47:40]), .multiplier(3'b010), .product(TempOut[143:136]));
        mult instance_48(.clock(clk), .multiplicand(input_s[39:32]), .multiplier(3'b101), .product(TempOut[135:128]));
        
             // for output (0,3) 
        mult instance_49(.clock(clk), .multiplicand(input_s[31:24]), .multiplier(3'b101), .product(TempOut[127:120]));
        mult instance_50(.clock(clk), .multiplicand(input_s[23:16]), .multiplier(3'b011), .product(TempOut[119:112]));
        mult instance_51(.clock(clk), .multiplicand(input_s[15:8]), .multiplier(3'b100), .product(TempOut[111:104]));
        mult instance_52(.clock(clk), .multiplicand(input_s[7:0]), .multiplier(3'b010), .product(TempOut[103:96]));
        
        // output(1,3)
        mult instance_53(.clock(clk), .multiplicand(input_s[31:24]), .multiplier(3'b010), .product(TempOut[95:88]));
        mult instance_54(.clock(clk), .multiplicand(input_s[23:16]), .multiplier(3'b101), .product(TempOut[87:80]));
        mult instance_55(.clock(clk), .multiplicand(input_s[15:8]), .multiplier(3'b011), .product(TempOut[79:72]));
        mult instance_56(.clock(clk), .multiplicand(input_s[7:0]), .multiplier(3'b100), .product(TempOut[71:64]));
        
        // output(2,3)
        mult instance_57(.clock(clk), .multiplicand(input_s[31:24]), .multiplier(3'b100), .product(TempOut[63:56]));
        mult instance_58(.clock(clk), .multiplicand(input_s[23:16]), .multiplier(3'b010), .product(TempOut[55:48]));
        mult instance_59(.clock(clk), .multiplicand(input_s[15:8]), .multiplier(3'b101), .product(TempOut[47:40]));
        mult instance_60(.clock(clk), .multiplicand(input_s[7:0]), .multiplier(3'b011), .product(TempOut[39:32]));
        
        // output(3,3)
        mult instance_61(.clock(clk), .multiplicand(input_s[31:24]), .multiplier(3'b011), .product(TempOut[31:24]));
        mult instance_62(.clock(clk), .multiplicand(input_s[23:16]), .multiplier(3'b100), .product(TempOut[23:16]));
        mult instance_63(.clock(clk), .multiplicand(input_s[15:8]), .multiplier(3'b010), .product(TempOut[15:8]));
        mult instance_64(.clock(clk), .multiplicand(input_s[7:0]), .multiplier(3'b101), .product(TempOut[7:0]));
        
        
         always @(posedge clk) begin  
         
       
        //First column (0,0)
        output_s [127:120] = TempOut[511:504] ^TempOut[503:496] ^TempOut[495:488] ^ TempOut[487:480];
      //First column (1,0)
      
        output_s [119:112] = TempOut[479:472] ^TempOut[471:464] ^TempOut[463:456] ^TempOut[455:448];
        // Output (2,0)
        
       output_s [111:104] = TempOut[447:440] ^ TempOut[439:432] ^TempOut[431:424] ^TempOut[423:416];
        
        // (3,0)
        output_s [103:96] = TempOut[415:408] ^ TempOut[407:400] ^ TempOut[399:392] ^ TempOut[391:384];
        
        
        // (0,1)
        output_s [95:88] = TempOut[383:376] ^ TempOut[375:368] ^ TempOut[367:360] ^ TempOut[359:352];
        //(1,1)
        output_s [87:80] =TempOut[351:344] ^ TempOut[343:336] ^ TempOut[335:328] ^ TempOut[327:320];
        // (2,1)
        output_s  [79:72] = TempOut[319:312] ^ TempOut[311:304] ^ TempOut[303:296] ^ TempOut[295:288];
        //(3,1)
        output_s [71:64] =TempOut[287:280] ^ TempOut[279:272] ^ TempOut[271:264] ^ TempOut[263:256]; 
        
        
        //(0,2)
        output_s [63:56] = TempOut[255:248] ^ TempOut[247:240] ^ TempOut[239:232] ^ TempOut[231:224];
        
        // (1,2)
        output_s [55:48] = TempOut[223:216] ^ TempOut[215:208] ^ TempOut[207:200] ^ TempOut[199:192];
        
        //(2,2)
        output_s [47:40] = TempOut[191:184] ^ TempOut[183:176] ^ TempOut[175:168] ^ TempOut[167:160] ;
        
        //X(2,3)
        output_s [39:32] = TempOut[159:152] ^ TempOut[151:144] ^ TempOut[143:136] ^ TempOut[135:128] ;
        
        //(0,3)
        output_s [31:24] =TempOut[127:120] ^ TempOut[119:112] ^ TempOut[111:104] ^ TempOut[103:96];
        
        //(1,3)
        output_s [23:16] = TempOut[95:88] ^ TempOut[87:80] ^ TempOut[79:72] ^ TempOut[71:64];
        
        //(2,3)
        output_s [15:8] = TempOut[63:56] ^ TempOut[55:48] ^ TempOut[47:40] ^ TempOut[39:32] ;
        //(3,3)
        output_s [7:0] =TempOut[31:24] ^ TempOut[23:16] ^ TempOut[15:8] ^ TempOut[7:0];
        end

endmodule
