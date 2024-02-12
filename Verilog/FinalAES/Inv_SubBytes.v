`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//The code applies substitution to different 8-bit segments of an 128-bit input message
//using 16 instance of Inverse Sbox module. 
//written by K Sikorski 
//////////////////////////////////////////////////////////////////////////////////


module Inv_SubBytes(message, Dmessage);
//declare 128-bit input and output
input[127:0] message;
output[127:0] Dmessage;
//The next lines instantiate 16 instances of an Sbox module
//Each Sbox takes 8bits of input and produces 8bits of output 
// The connections are established by specyfying the relevant portions of encrypted message (input)
// and Dmessage(output), decrypted message for the InverseSbox instances
    Inv_Sbox Sbox_1( .state(message[127:120]),.Sstate(Dmessage[127:120]) );
    Inv_Sbox Sbox_2( .state(message[119:112]),.Sstate(Dmessage[119:112]) );
    Inv_Sbox Sbox_3( .state(message[111:104]),.Sstate(Dmessage[111:104]) );
    Inv_Sbox Sbox_4( .state(message[103:96]),.Sstate(Dmessage[103:96]) );
     
    Inv_Sbox Sbox_5( .state(message[95:88]),.Sstate(Dmessage[95:88]) );
    Inv_Sbox Sbox_6( .state(message[87:80]),.Sstate(Dmessage[87:80]) );
    Inv_Sbox Sbox_7( .state(message[79:72]),.Sstate(Dmessage[79:72]) );
    Inv_Sbox Sbox_8( .state(message[71:64]),.Sstate(Dmessage[71:64]) );
     
    Inv_Sbox Sbox_9( .state(message[63:56]),.Sstate(Dmessage[63:56]) );
    Inv_Sbox Sbox_10( .state(message[55:48]),.Sstate(Dmessage[55:48]) );
    Inv_Sbox Sbox_11(.state(message[47:40]),.Sstate(Dmessage[47:40]) );
    Inv_Sbox Sbox_12(.state(message[39:32]),.Sstate(Dmessage[39:32]) );
     
    Inv_Sbox Sbox_13(.state(message[31:24]),.Sstate(Dmessage[31:24]) );
    Inv_Sbox Sbox_14(.state(message[23:16]),.Sstate(Dmessage[23:16]) );
    Inv_Sbox Sbox_15(.state(message[15:8]),.Sstate(Dmessage[15:8]) );
    Inv_Sbox Sbox_16(.state(message[7:0]),.Sstate(Dmessage[7:0]) );


endmodule
