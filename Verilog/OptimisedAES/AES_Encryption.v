`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2024 22:07:36
// Design Name: 
// Module Name: AES_Encryption
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AES_Encryption(
input clk,
input Message,
inpu Key, 
output E_Message
    );
 //Declaration of inputs and outputs   
input clk;
input [127:0] Message, Key;
output [127:0] E_Message;

// Temporary register to store 128 bit output of modules    

reg [127:0] TempStorage;
reg [127:0] TempStorage2;

 // Placeholder for wires and declarations for AES_Encryption
 
 // Round 0 - XOR with initial cipher
 // need to look into the module to check how adresses should be assigned - update later
 assign TempStorage = Message ^ r0_key;
 
 // rounds 
    doRound round1(clk, TempStorage, r1_key, TempStorage2);
    doRound round2(clk, TempStorage2, r2_key, TempStorage);
    doRound round3(clk, TempStorage, r3_key, TempStorage2);
    doRound round4(clk, TempStorage2, r4_key, TempStorage);
    doRound round5(clk, TempStorage, r5_key, TempStorage2);
    doRound round6(clk, TempStorage2, r6_key, TempStorage);
    doRound round7(clk, TempStorage, r7_key, TempStorage2);
    doRound round8(clk, TempStorage2, r8_key, TempStorage);
    doRound round9(clk, TempStorage, r9_key, TempStorage2);
    
     // Final round - skips mix columns
    lastRound round10(clk, TempStorage2, r10_key, TempStorage);
    
    assign E_Message =TempStorage;
    
endmodule
