`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//The code applies substitution to different 8-bit segments of an 128-bit input message
// using 16 instance of Sbox module. 
//written by K Sikorski 
//////////////////////////////////////////////////////////////////////////////////


module SubBytes(message,Emessage);
//declare 128-bit input and output
input[127:0] message;
output[127:0] Emessage;
//The next lines instantiate 16 instances of an Sbox module
//Each Sbox takes 8bits of input and produces 8bits of output 
// The connections are established by specyfying the relevant portions of message (input)
// and Emessage(output) for the Sbox instances
    Sbox Sbox_1( .state(message[127:120]),.Sstate(Emessage[127:120]) );
    Sbox Sbox_2( .state(message[119:112]),.Sstate(Emessage[119:112]) );
    Sbox Sbox_3( .state(message[111:104]),.Sstate(Emessage[111:104]) );
    Sbox Sbox_4( .state(message[103:96]),.Sstate(Emessage[103:96]) );
     
    Sbox Sbox_5( .state(message[95:88]),.Sstate(Emessage[95:88]) );
    Sbox Sbox_6( .state(message[87:80]),.Sstate(Emessage[87:80]) );
    Sbox Sbox_7( .state(message[79:72]),.Sstate(Emessage[79:72]) );
    Sbox Sbox_8( .state(message[71:64]),.Sstate(Emessage[71:64]) );
     
    Sbox Sbox_9( .state(message[63:56]),.Sstate(Emessage[63:56]) );
    Sbox Sbox_10( .state(message[55:48]),.Sstate(Emessage[55:48]) );
    Sbox Sbox_11(.state(message[47:40]),.Sstate(Emessage[47:40]) );
    Sbox Sbox_12(.state(message[39:32]),.Sstate(Emessage[39:32]) );
     
    Sbox Sbox_13(.state(message[31:24]),.Sstate(Emessage[31:24]) );
    Sbox Sbox_14(.state(message[23:16]),.Sstate(Emessage[23:16]) );
    Sbox Sbox_15(.state(message[15:8]),.Sstate(Emessage[15:8]) );
    Sbox Sbox_16(.state(message[7:0]),.Sstate(Emessage[7:0]) );

endmodule
