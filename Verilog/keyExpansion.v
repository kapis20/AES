`timescale 1ns / 1ps

// Key expansion algorithm - generates 10 unique keys, 1 for each round of the AES algorithm
module keyExpansion(
    clk, 
    input_key, 
    r0_key, 
    r1_key, 
    r2_key, 
    r3_key, 
    r4_key, 
    r5_key, 
    r6_key, 
    r7_key, 
    r8_key, 
    r9_key, 
    r10_key
    );

    // Declare inputs and outputs
    // Inputs: cipher key, clock
    // Outputs: round keys, denoted by rN_key, where N is the round
    input [127:0] input_key;
    input clk;
    output [127:0] r0_key, r1_key, r2_key, r3_key, r4_key, r5_key, r6_key, r7_key, r8_key, r9_key, r10_key;
    
    // Additional variables: w0 - w43 are the individual words used to form each rounds key
    reg	[31:0]	w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31, w32, w33, w34, w35, w36, w37, w38, w39, w40, w41, w42, w43;
    wire [31:0]	subword, subword2, subword3, subword4, subword5, subword6, subword7, subword8, subword9, subword10;			

    // Get each subword - these are the words produced by Sbox
    // This part combines both steps of shifting the words by one, and then substituting bytes

    // Round 1
    Sbox u0(w3[23:16], subword[31:24]);
    Sbox u1(w3[15:8], subword[23:16]);
    Sbox u2(w3[7:0], subword[15:8]);
    Sbox u3(w3[31:24], subword[7:0]); 
 
    // Round 2   
    Sbox u4(w7[23:16], subword2[31:24]);
    Sbox u5(w7[15:08], subword2[23:16]);
    Sbox u6(w7[7:0], subword2[15:8]);
    Sbox u7(w7[31:24], subword2[7:0]); 
    
    // Round 3
    Sbox u8(w11[23:16], subword3[31:24]);
    Sbox u9(w11[15:8], subword3[23:16]);
    Sbox u10(w11[7:0], subword3[15:08]);
    Sbox u11(w11[31:24], subword3[7:0]); 
    
    // Round 4
    Sbox u12(w15[23:16], subword4[31:24]);
    Sbox u13(w15[15:08], subword4[23:16]);
    Sbox u14(w15[7:0], subword4[15:8]);
    Sbox u15(w15[31:24], subword4[7:0]); 
    
    // ROund 5
    Sbox u16(w19[23:16],subword5[31:24]);
    Sbox u17(w19[15:8], subword5[23:16]);
    Sbox u18(w19[7:0], subword5[15:8]);
    Sbox u19(w19[31:24], subword5[7:0]); 
    
    // Round 6
    Sbox u20(w23[23:16], subword6[31:24]);
    Sbox u21(w23[15:8], subword6[23:16]);
    Sbox u22(w23[7:0], subword6[15:8]);
    Sbox u23(w23[31:24], subword6[7:0]); 
    
    // Round 7
    Sbox u24(w27[23:16], subword7[31:24]);
    Sbox u25(w27[15:08], subword7[23:16]);
    Sbox u26(w27[7:0], subword7[15:8]);
    Sbox u27(w27[31:24], subword7[7:0]); 
    
    // Round 8
    Sbox u28(w31[23:16], subword8[31:24]);
    Sbox u29(w31[15:08], subword8[23:16]);
    Sbox u30(w31[7:0], subword8[15:8]);
    Sbox u31(w31[31:24], subword8[7:0]); 
    
    // Round 9
    Sbox u32(w35[23:16], subword9[31:24]);
    Sbox u33(w35[15:08], subword9[23:16]);
    Sbox u34(w35[7:0], subword9[15:8]);
    Sbox u35(w35[31:24], subword9[7:0]); 
    
    // Round 10
    Sbox u36(w39[23:16], subword10[31:24]);
    Sbox u37(w39[15:08], subword10[23:16]);
    Sbox u38(w39[7:0], subword10[15:8]);
    Sbox u39(w39[31:24], subword10[7:0]); 
    
    // Concatenate words for each round key
    assign r0_key={w0,w1,w2,w3};
    assign r1_key={w4,w5,w6,w7};
    assign r2_key={w8,w9,w10,w11};
    assign r3_key={w12,w13,w14,w15};
    assign r4_key={w16,w17,w18,w19};
    assign r5_key={w20,w21,w22,w23};
    assign r6_key={w24,w25,w26,w27};
    assign r7_key={w28,w29,w30,w31};
    assign r8_key={w32,w33,w34,w35};
    assign r9_key={w36,w37,w38,w39};
    assign r10_key={w40,w41,w42,w43};
    
    always @(posedge clk)
    begin
     
        // 4 words are used for each round
        // The words from the previous round are used for the current round
        
        // Round 0 - values remain the same
        w0 =  input_key[127:096];
        w1 =  input_key[095:064];
        w2 =  input_key[063:032];
        w3 =  input_key[031:000];
        
        // Round 1
        w4 =  w0^subword^{8'h01,24'b0};
        w5 =  w1^w0^subword^{8'h01,24'b0};
        w6 =  w2^w1^w0^subword^{8'h01,24'b0}; 
        w7 =  w3^w2^w1^w0^subword^{8'h01,24'b0};
        
        // Round 2
        w8  =  w4^subword2^{8'h02,24'b0};
        w9  =  w5^w4^subword2^{8'h02,24'b0};
        w10 =  w6^w5^w4^subword2^{8'h02,24'b0}; 
        w11 =  w7^w6^w5^w4^subword2^{8'h02,24'b0};
        
        // Round 3
        w12  =  w8^subword3^{8'h04,24'b0};
        w13  =  w8^w9^subword3^{8'h04,24'b0};
        w14  =  w8^w9^w10^subword3^{8'h04,24'b0}; 
        w15  =  w8^w9^w10^w11^subword3^{8'h04,24'b0};
        
        // Round 4
        w16  =  w12^subword4^{8'h08,24'b0};
        w17  =  w12^w13^subword4^{8'h08,24'b0};
        w18  =  w12^w13^w14^subword4^{8'h08,24'b0}; 
        w19  =  w12^w13^w14^w15^subword4^{8'h08,24'b0};
        
        // Round 5
        w20  =  w16^subword5^{8'h10,24'b0};
        w21  =  w16^w17^subword5^{8'h10,24'b0};
        w22  =  w16^w17^w18^subword5^{8'h10,24'b0}; 
        w23  =  w16^w17^w18^w19^subword5^{8'h10,24'b0};
        
        // Round 6
        w24  =  w20^subword6^{8'h20,24'b0};
        w25  =  w20^w21^subword6^{8'h20,24'b0};
        w26  =  w20^w21^w22^subword6^{8'h20,24'b0}; 
        w27  =  w20^w21^w22^w23^subword6^{8'h20,24'b0};
        
        // Round 7
        w28  =  w24^subword7^{8'h40,24'b0};
        w29  =  w24^w25^subword7^{8'h40,24'b0};
        w30  =  w24^w25^w26^subword7^{8'h40,24'b0}; 
        w31  =  w24^w25^w26^w27^subword7^{8'h40,24'b0};
        
        // Round 8
        w32  =  w28^subword8^{8'h80,24'b0};
        w33  =  w28^w29^subword8^{8'h80,24'b0};
        w34  =  w28^w29^w30^subword8^{8'h80,24'b0}; 
        w35  =  w28^w29^w30^w31^subword8^{8'h80,24'b0};
        
        // Round 9
        w36  =  w32^subword9^{8'h1b,24'b0};
        w37  =  w32^w33^subword9^{8'h1b,24'b0};
        w38  =  w32^w33^w34^subword9^{8'h1b,24'b0}; 
        w39  =  w32^w33^w34^w35^subword9^{8'h1b,24'b0};
        
        // Round 10
        w40  =  w36^subword10^{8'h36,24'b0};
        w41  =  w36^w37^subword10^{8'h36,24'b0};
        w42  =  w36^w37^w38^subword10^{8'h36,24'b0}; 
        w43  =  w36^w37^w38^w39^subword10^{8'h36,24'b0};
    
    end
    
endmodule