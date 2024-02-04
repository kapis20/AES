`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//Inverse Sbox 
// Written by K Sikorski  
//////////////////////////////////////////////////////////////////////////////////


module Inv_Sbox(state,Sstate);

input[7:0] state; //encrypted byte
output [7:0] Sstate; //decrypted byte

//Register to store the output
reg[7:0] Sstate;

//Combitional Logic-Case Statement:
//Trigger always block whenever there is a change in 
//input 

always@(state)
case(state)
//Rijndael Inverse Sbox table:
       8'h00: Sstate =8'h52;
	   8'h01: Sstate =8'h09;
	   8'h02: Sstate =8'h6a;
	   8'h03: Sstate =8'hd5;
	   8'h04: Sstate =8'h30;
	   8'h05: Sstate = 8'h36;
	   8'h06: Sstate = 8'ha5;
	   8'h07: Sstate = 8'h38;
	   8'h08: Sstate =8'hbf;
	   8'h09: Sstate =8'h40;
	   8'h0a: Sstate =8'ha3;
	   8'h0b: Sstate =8'h9e;
	   8'h0c: Sstate =8'h81;
	   8'h0d: Sstate =8'hf3;
	   8'h0e: Sstate =8'hd7;
	   8'h0f: Sstate =8'hfb;
	   
	   8'h10: Sstate = 8'h7c;
       8'h11: Sstate = 8'he3;
       8'h12: Sstate = 8'h39;
       8'h13: Sstate = 8'h82;
       8'h14: Sstate = 8'h9b;
       8'h15: Sstate = 8'h2f;
       8'h16: Sstate = 8'hff;
       8'h17: Sstate = 8'h87;
       8'h18: Sstate = 8'h34;
       8'h19: Sstate = 8'h8e;
       8'h1a: Sstate = 8'h43;
       8'h1b: Sstate = 8'h44;
       8'h1c: Sstate = 8'hc4;
       8'h1d: Sstate = 8'hde;
       8'h1e: Sstate = 8'he9;
       8'h1f: Sstate = 8'hcb;
       
	   8'h20: Sstate = 8'h54;
       8'h21: Sstate = 8'h7b;
       8'h22: Sstate = 8'h94;
       8'h23: Sstate = 8'h32;
       8'h24: Sstate = 8'ha6;
       8'h25: Sstate = 8'hc2;
       8'h26: Sstate = 8'h23;
       8'h27: Sstate = 8'h3d;
       8'h28: Sstate = 8'hee;
       8'h29: Sstate = 8'h4c;
       8'h2a: Sstate = 8'h95;
       8'h2b: Sstate = 8'h0b;
       8'h2c: Sstate = 8'h42;
       8'h2d: Sstate = 8'hfa;
       8'h2e: Sstate = 8'hc3;
       8'h2f: Sstate = 8'h4e;
	   
	   8'h30: Sstate = 8'h08;
       8'h31: Sstate = 8'h2e;
       8'h32: Sstate = 8'ha1;
       8'h33: Sstate = 8'h66;
       8'h34: Sstate = 8'h28;
       8'h35: Sstate = 8'hd9;
       8'h36: Sstate = 8'h24;
       8'h37: Sstate = 8'hb2;
       8'h38: Sstate = 8'h76;
       8'h39: Sstate = 8'h5b;
       8'h3a: Sstate = 8'ha2;
       8'h3b: Sstate = 8'h49;
       8'h3c: Sstate = 8'h6d;
       8'h3d: Sstate = 8'h8b;
       8'h3e: Sstate = 8'hd1;
       8'h3f: Sstate = 8'h25;
	   
	    8'h40: Sstate = 8'h72;
        8'h41: Sstate = 8'hf8;
        8'h42: Sstate = 8'hf6;
        8'h43: Sstate = 8'h64;
        8'h44: Sstate = 8'h86;
        8'h45: Sstate = 8'h68;
        8'h46: Sstate = 8'h98;
        8'h47: Sstate = 8'h16;
        8'h48: Sstate = 8'hd4;
        8'h49: Sstate = 8'ha4;
        8'h4a: Sstate = 8'h5c;
        8'h4b: Sstate = 8'hcc;
        8'h4c: Sstate = 8'h5d;
        8'h4d: Sstate = 8'h65;
        8'h4e: Sstate = 8'hb6;
        8'h4f: Sstate = 8'h92;
	   
	    8'h50: Sstate = 8'h6c;
        8'h51: Sstate = 8'h70;
        8'h52: Sstate = 8'h48;
        8'h53: Sstate = 8'h50;
        8'h54: Sstate = 8'hfd;
        8'h55: Sstate = 8'hed;
        8'h56: Sstate = 8'hb9;
        8'h57: Sstate = 8'hda;
        8'h58: Sstate = 8'h5e;
        8'h59: Sstate = 8'h15;
        8'h5a: Sstate = 8'h46;
        8'h5b: Sstate = 8'h57;
        8'h5c: Sstate = 8'ha7;
        8'h5d: Sstate = 8'h8d;
        8'h5e: Sstate = 8'h9d;
        8'h5f: Sstate = 8'h84;
	   
	    8'h60: Sstate = 8'h90;
        8'h61: Sstate = 8'hd8;
        8'h62: Sstate = 8'hab;
        8'h63: Sstate = 8'h00;
        8'h64: Sstate = 8'h8c;
        8'h65: Sstate = 8'hbc;
        8'h66: Sstate = 8'hd3;
        8'h67: Sstate = 8'h0a;
        8'h68: Sstate = 8'hf7;
        8'h69: Sstate = 8'he4;
        8'h6a: Sstate = 8'h58;
        8'h6b: Sstate = 8'h05;
        8'h6c: Sstate = 8'hb8;
        8'h6d: Sstate = 8'hb3;
        8'h6e: Sstate = 8'h45;
        8'h6f: Sstate = 8'h06;
	   
	    8'h70: Sstate = 8'hd0;
        8'h71: Sstate = 8'h2c;
        8'h72: Sstate = 8'h1e;
        8'h73: Sstate = 8'h8f;
        8'h74: Sstate = 8'hca;
        8'h75: Sstate = 8'h3f;
        8'h76: Sstate = 8'h0f;
        8'h77: Sstate = 8'h02;
        8'h78: Sstate = 8'hc1;
        8'h79: Sstate = 8'haf;
        8'h7a: Sstate = 8'hbd;
        8'h7b: Sstate = 8'h03;
        8'h7c: Sstate = 8'h01;
        8'h7d: Sstate = 8'h13;
        8'h7e: Sstate = 8'h8a;
        8'h7f: Sstate = 8'h6b;
        
        8'h80: Sstate = 8'h3a;
        8'h81: Sstate = 8'h91;
        8'h82: Sstate = 8'h11;
        8'h83: Sstate = 8'h41;
        8'h84: Sstate = 8'h4f;
        8'h85: Sstate = 8'h67;
        8'h86: Sstate = 8'hdc;
        8'h87: Sstate = 8'hea;
        8'h88: Sstate = 8'h97;
        8'h89: Sstate = 8'hf2;
        8'h8a: Sstate = 8'hcf;
        8'h8b: Sstate = 8'hce;
        8'h8c: Sstate = 8'hf0;
        8'h8d: Sstate = 8'hb4;
        8'h8e: Sstate = 8'he6;
        8'h8f: Sstate = 8'h73;
        
        8'h90: Sstate = 8'h96;
        8'h91: Sstate = 8'hac;
        8'h92: Sstate = 8'h74;
        8'h93: Sstate = 8'h22;
        8'h94: Sstate = 8'he7;
        8'h95: Sstate = 8'had;
        8'h96: Sstate = 8'h35;
        8'h97: Sstate = 8'h85;
        8'h98: Sstate = 8'he2;
        8'h99: Sstate = 8'hf9;
        8'h9a: Sstate = 8'h37;
        8'h9b: Sstate = 8'he8;
        8'h9c: Sstate = 8'h1c;
        8'h9d: Sstate = 8'h75;
        8'h9e: Sstate = 8'hdf;
        8'h9f: Sstate = 8'h6e;
        
        8'ha0: Sstate = 8'h47;
        8'ha1: Sstate = 8'hf1;
        8'ha2: Sstate = 8'h1a;
        8'ha3: Sstate = 8'h71;
        8'ha4: Sstate = 8'h1d;
        8'ha5: Sstate = 8'h29;
        8'ha6: Sstate = 8'hc5;
        8'ha7: Sstate = 8'h89;
        8'ha8: Sstate = 8'h6f;
        8'ha9: Sstate = 8'hb7;
        8'haa: Sstate = 8'h62;
        8'hab: Sstate = 8'h0e;
        8'hac: Sstate = 8'haa;
        8'had: Sstate = 8'h18;
        8'hae: Sstate = 8'hbe;
        8'haf: Sstate = 8'h1b;
        
        8'hb0: Sstate = 8'hfc;
        8'hb1: Sstate = 8'h56;
        8'hb2: Sstate = 8'h3e;
        8'hb3: Sstate = 8'h4b;
        8'hb4: Sstate = 8'hc6;
        8'hb5: Sstate = 8'hd2;
        8'hb6: Sstate = 8'h79;
        8'hb7: Sstate = 8'h20;
        8'hb8: Sstate = 8'h9a;
        8'hb9: Sstate = 8'hdb;
        8'hba: Sstate = 8'hc0;
        8'hbb: Sstate = 8'hfe;
        8'hbc: Sstate = 8'h78;
        8'hbd: Sstate = 8'hcd;
        8'hbe: Sstate = 8'h5a;
        8'hbf: Sstate = 8'hf4;
        
        8'hc0: Sstate = 8'h1f;
        8'hc1: Sstate = 8'hdd;
        8'hc2: Sstate = 8'ha8;
        8'hc3: Sstate = 8'h33;
        8'hc4: Sstate = 8'h88;
        8'hc5: Sstate = 8'h07;
        8'hc6: Sstate = 8'hc7;
        8'hc7: Sstate = 8'h31;
        8'hc8: Sstate = 8'hb1;
        8'hc9: Sstate = 8'h12;
        8'hca: Sstate = 8'h10;
        8'hcb: Sstate = 8'h59;
        8'hcc: Sstate = 8'h27;
        8'hcd: Sstate = 8'h80;
        8'hce: Sstate = 8'hec;
        8'hcf: Sstate = 8'h5f;
        
        8'hd0: Sstate = 8'h60;
        8'hd1: Sstate = 8'h51;
        8'hd2: Sstate = 8'h7f;
        8'hd3: Sstate = 8'ha9;
        8'hd4: Sstate = 8'h19;
        8'hd5: Sstate = 8'hb5;
        8'hd6: Sstate = 8'h4a;
        8'hd7: Sstate = 8'h0d;
        8'hd8: Sstate = 8'h2d;
        8'hd9: Sstate = 8'he5;
        8'hda: Sstate = 8'h7a;
        8'hdb: Sstate = 8'h9f;
        8'hdc: Sstate = 8'h93;
        8'hdd: Sstate = 8'hc9;
        8'hde: Sstate = 8'h9c;
        8'hdf: Sstate = 8'hef;
        
        8'he0: Sstate = 8'ha0;
        8'he1: Sstate = 8'he0;
        8'he2: Sstate = 8'h3b;
        8'he3: Sstate = 8'h4d;
        8'he4: Sstate = 8'hae;
        8'he5: Sstate = 8'h2a;
        8'he6: Sstate = 8'hf5;
        8'he7: Sstate = 8'hb0;
        8'he8: Sstate = 8'hc8;
        8'he9: Sstate = 8'heb;
        8'hea: Sstate = 8'hbb;
        8'heb: Sstate = 8'h3c;
        8'hec: Sstate = 8'h83;
        8'hed: Sstate = 8'h53;
        8'hee: Sstate = 8'h99;
        8'hef: Sstate = 8'h61;
        
        8'hf0: Sstate = 8'h17;
        8'hf1: Sstate = 8'h2b;
        8'hf2: Sstate = 8'h04;
        8'hf3: Sstate = 8'h7e;
        8'hf4: Sstate = 8'hba;
        8'hf5: Sstate = 8'h77;
        8'hf6: Sstate = 8'hd6;
        8'hf7: Sstate = 8'h26;
        8'hf8: Sstate = 8'he1;
        8'hf9: Sstate = 8'h69;
        8'hfa: Sstate = 8'h14;
        8'hfb: Sstate = 8'h63;
        8'hfc: Sstate = 8'h55;
        8'hfd: Sstate = 8'h21;
        8'hfe: Sstate = 8'h0c;
        8'hff: Sstate = 8'h7d;

    endcase 
endmodule
