`timescale 1ns / 1ps

//Subytes taking 8bit input and assigning new 8bit output every positive clock edge
// The lookup table is declared using the ROM memorry blocks
//written by K. Sikorski


module SubBytes(
    input [7:0] state,
    input clk,
    output reg [7:0] Sstate
    );
    // Define S-box values as a lookup table in a memory array sbox with 256 entries, eacj 8 bits wide 
    // the valeus represent a Rijandel's lookup table 
    // case statement is utilised to create a ROM structure to initialise sbox array with specific values
    // at each address corresponding to a apporpiate entries in a lookup table 
    reg [7:0] sbox [0:255];
    
    // Populate the ROM with the S-box values using a case statement
     always @(*) // triggered whenever there is a change in a signal 
     begin
        case(state)
        8'h00: sbox[state] = 8'h63;
        8'h01: sbox[state] = 8'h7c;
        8'h02: sbox[state] = 8'h77;
        8'h03: sbox[state] = 8'h7b;
        8'h04: sbox[state] = 8'hf2;
        8'h05: sbox[state] = 8'h6b;
        8'h06: sbox[state] = 8'h6f;
        8'h07: sbox[state] = 8'hc5;
        8'h08: sbox[state] = 8'h30;
        8'h09: sbox[state] = 8'h01;
        8'h0a: sbox[state] = 8'h67;
        8'h0b: sbox[state] = 8'h2b;
        8'h0c: sbox[state] = 8'hfe;
        8'h0d: sbox[state] = 8'hd7;
        8'h0e: sbox[state] = 8'hab;
        8'h0f: sbox[state] = 8'h76;
        8'h10: sbox[state] = 8'hca;
        8'h11: sbox[state] = 8'h82;
        8'h12: sbox[state] = 8'hc9;
        8'h13: sbox[state] = 8'h7d;
        8'h14: sbox[state] = 8'hfa;
        8'h15: sbox[state] = 8'h59;
        8'h16: sbox[state] = 8'h47;
        8'h17: sbox[state] = 8'hf0;
        8'h18: sbox[state] = 8'had;
        8'h19: sbox[state] = 8'hd4;
        8'h1a: sbox[state] = 8'ha2;
        8'h1b: sbox[state] = 8'haf;
        8'h1c: sbox[state] = 8'h9c;
        8'h1d: sbox[state] = 8'ha4;
        8'h1e: sbox[state] = 8'h72;
        8'h1f: sbox[state] = 8'hc0;
        8'h20: sbox[state] = 8'hb7;
        8'h21: sbox[state] = 8'hfd;
        8'h22: sbox[state] = 8'h93;
        8'h23: sbox[state] = 8'h26;
        8'h24: sbox[state] = 8'h36;
        8'h25: sbox[state] = 8'h3f;
        8'h26: sbox[state] = 8'hf7;
        8'h27: sbox[state] = 8'hcc;
        8'h28: sbox[state] = 8'h34;
        8'h29: sbox[state] = 8'ha5;
        8'h2a: sbox[state] = 8'he5;
        8'h2b: sbox[state] = 8'hf1;
        8'h2c: sbox[state] = 8'h71;
        8'h2d: sbox[state] = 8'hd8;
        8'h2e: sbox[state] = 8'h31;
        8'h2f: sbox[state] = 8'h15;
        8'h30: sbox[state] = 8'h04;
        8'h31: sbox[state] = 8'hc7;
        8'h32: sbox[state] = 8'h23;
        8'h33: sbox[state] = 8'hc3;
        8'h34: sbox[state] = 8'h18;
        8'h35: sbox[state] = 8'h96;
        8'h36: sbox[state] = 8'h05;
        8'h37: sbox[state] = 8'h9a;
        8'h38: sbox[state] = 8'h07;
        8'h39: sbox[state] = 8'h12;
        8'h3a: sbox[state] = 8'h80;
        8'h3b: sbox[state] = 8'he2;
        8'h3c: sbox[state] = 8'heb;
        8'h3d: sbox[state] = 8'h27;
        8'h3e: sbox[state] = 8'hb2;
        8'h3f: sbox[state] = 8'h75;
        8'h40: sbox[state] = 8'h09;
        8'h41: sbox[state] = 8'h83;
        8'h42: sbox[state] = 8'h2c;
        8'h43: sbox[state] = 8'h1a;
        8'h44: sbox[state] = 8'h1b;
        8'h45: sbox[state] = 8'h6e;
        8'h46: sbox[state] = 8'h5a;
        8'h47: sbox[state] = 8'ha0;
        8'h48: sbox[state] = 8'h52;
        8'h49: sbox[state] = 8'h3b;
        8'h4a: sbox[state] = 8'hd6;
        8'h4b: sbox[state] = 8'hb3;
        8'h4c: sbox[state] = 8'h29;
        8'h4d: sbox[state] = 8'he3;
        8'h4e: sbox[state] = 8'h2f;
        8'h4f: sbox[state] = 8'h84;
        8'h50: sbox[state] = 8'h53;
        8'h51: sbox[state] = 8'hd1;
        8'h52: sbox[state] = 8'h00;
        8'h53: sbox[state] = 8'hed;
        8'h54: sbox[state] = 8'h20;
        8'h55: sbox[state] = 8'hfc;
        8'h56: sbox[state] = 8'hb1;
        8'h57: sbox[state] = 8'h5b;
        8'h58: sbox[state] = 8'h6a;
        8'h59: sbox[state] = 8'hcb;
        8'h5a: sbox[state] = 8'hbe;
        8'h5b: sbox[state] = 8'h39;
        8'h5c: sbox[state] = 8'h4a;
        8'h5d: sbox[state] = 8'h4c;
        8'h5e: sbox[state] = 8'h58;
        8'h5f: sbox[state] = 8'hcf;
        8'h60: sbox[state] = 8'hd0;
        8'h61: sbox[state] = 8'hef;
        8'h62: sbox[state] = 8'haa;
        8'h63: sbox[state] = 8'hfb;
        8'h64: sbox[state] = 8'h43;
        8'h65: sbox[state] = 8'h4d;
        8'h66: sbox[state] = 8'h33;
        8'h67: sbox[state] = 8'h85;
        8'h68: sbox[state] = 8'h45;
        8'h69: sbox[state] = 8'hf9;
        8'h6a: sbox[state] = 8'h02;
        8'h6b: sbox[state] = 8'h7f;
        8'h6c: sbox[state] = 8'h50;
        8'h6d: sbox[state] = 8'h3c;
        8'h6e: sbox[state] = 8'h9f;
        8'h6f: sbox[state] = 8'ha8;
        8'h70: sbox[state] = 8'h51;
        8'h71: sbox[state] = 8'ha3;
        8'h72: sbox[state] = 8'h40;
        8'h73: sbox[state] = 8'h8f;
        8'h74: sbox[state] = 8'h92;
        8'h75: sbox[state] = 8'h9d;
        8'h76: sbox[state] = 8'h38;
        8'h77: sbox[state] = 8'hf5;
        8'h78: sbox[state] = 8'hbc;
        8'h79: sbox[state] = 8'hb6;
        8'h7a: sbox[state] = 8'hda;
        8'h7b: sbox[state] = 8'h21;
        8'h7c: sbox[state] = 8'h10;
        8'h7d: sbox[state] = 8'hff;
        8'h7e: sbox[state] = 8'hf3;
        8'h7f: sbox[state] = 8'hd2;
        8'h80: sbox[state] = 8'hcd;
        8'h81: sbox[state] = 8'h0c;
        8'h82: sbox[state] = 8'h13;
        8'h83: sbox[state] = 8'hec;
        8'h84: sbox[state] = 8'h5f;
        8'h85: sbox[state] = 8'h97;
        8'h86: sbox[state] = 8'h44;
        8'h87: sbox[state] = 8'h17;
        8'h88: sbox[state] = 8'hc4;
        8'h89: sbox[state] = 8'ha7;
        8'h8a: sbox[state] = 8'h7e;
        8'h8b: sbox[state] = 8'h3d;
        8'h8c: sbox[state] = 8'h64;
        8'h8d: sbox[state] = 8'h5d;
        8'h8e: sbox[state] = 8'h19;
        8'h8f: sbox[state] = 8'h73;
        8'h90: sbox[state] = 8'h60;
        8'h91: sbox[state] = 8'h81;
        8'h92: sbox[state] = 8'h4f;
        8'h93: sbox[state] = 8'hdc;
        8'h94: sbox[state] = 8'h22;
        8'h95: sbox[state] = 8'h2a;
        8'h96: sbox[state] = 8'h90;
        8'h97: sbox[state] = 8'h88;
        8'h98: sbox[state] = 8'h46;
        8'h99: sbox[state] = 8'hee;
        8'h9a: sbox[state] = 8'hb8;
        8'h9b: sbox[state] = 8'h14;
        8'h9c: sbox[state] = 8'hde;
        8'h9d: sbox[state] = 8'h5e;
        8'h9e: sbox[state] = 8'h0b;
        8'h9f: sbox[state] = 8'hdb;
        8'ha0: sbox[state] = 8'he0;
        8'ha1: sbox[state] = 8'h32;
        8'ha2: sbox[state] = 8'h3a;
        8'ha3: sbox[state] = 8'h0a;
        8'ha4: sbox[state] = 8'h49;
        8'ha5: sbox[state] = 8'h06;
        8'ha6: sbox[state] = 8'h24;
        8'ha7: sbox[state] = 8'h5c;
        8'ha8: sbox[state] = 8'hc2;
        8'ha9: sbox[state] = 8'hd3;
        8'haa: sbox[state] = 8'hac;
        8'hab: sbox[state] = 8'h62;
        8'hac: sbox[state] = 8'h91;
        8'had: sbox[state] = 8'h95;
        8'hae: sbox[state] = 8'he4;
        8'haf: sbox[state] = 8'h79;
        8'hb0: sbox[state] = 8'he7;
        8'hb1: sbox[state] = 8'hc8;
        8'hb2: sbox[state] = 8'h37;
        8'hb3: sbox[state] = 8'h6d;
        8'hb4: sbox[state] = 8'h8d;
        8'hb5: sbox[state] = 8'hd5;
        8'hb6: sbox[state] = 8'h4e;
        8'hb7: sbox[state] = 8'ha9;
        8'hb8: sbox[state] = 8'h6c;
        8'hb9: sbox[state] = 8'h56;
        8'hba: sbox[state] = 8'hf4;
        8'hbb: sbox[state] = 8'hea;
        8'hbc: sbox[state] = 8'h65;
        8'hbd: sbox[state] = 8'h7a;
        8'hbe: sbox[state] = 8'hae;
        8'hbf: sbox[state] = 8'h08;
        8'hc0: sbox[state] = 8'hba;
        8'hc1: sbox[state] = 8'h78;
        8'hc2: sbox[state] = 8'h25;
        8'hc3: sbox[state] = 8'h2e;
        8'hc4: sbox[state] = 8'h1c;
        8'hc5: sbox[state] = 8'ha6;
        8'hc6: sbox[state] = 8'hb4;
        8'hc7: sbox[state] = 8'hc6;
        8'hc8: sbox[state] = 8'he8;
        8'hc9: sbox[state] = 8'hdd;
        8'hca: sbox[state] = 8'h74;
        8'hcb: sbox[state] = 8'h1f;
        8'hcc: sbox[state] = 8'h4b;
        8'hcd: sbox[state] = 8'hbd;
        8'hce: sbox[state] = 8'h8b;
        8'hcf: sbox[state] = 8'h8a;
        8'hd0: sbox[state] = 8'h70;
        8'hd1: sbox[state] = 8'h3e;
        8'hd2: sbox[state] = 8'hb5;
        8'hd3: sbox[state] = 8'h66;
        8'hd4: sbox[state] = 8'h48;
        8'hd5: sbox[state] = 8'h03;
        8'hd6: sbox[state] = 8'hf6;
        8'hd7: sbox[state] = 8'h0e;
        8'hd8: sbox[state] = 8'h61;
        8'hd9: sbox[state] = 8'h35;
        8'hda: sbox[state] = 8'h57;
        8'hdb: sbox[state] = 8'hb9;
        8'hdc: sbox[state] = 8'h86;
        8'hdd: sbox[state] = 8'hc1;
        8'hde: sbox[state] = 8'h1d;
        8'hdf: sbox[state] = 8'h9e;
        8'he0: sbox[state] = 8'he1;
        8'he1: sbox[state] = 8'hf8;
        8'he2: sbox[state] = 8'h98;
        8'he3: sbox[state] = 8'h11;
        8'he4: sbox[state] = 8'h69;
        8'he5: sbox[state] = 8'hd9;
        8'he6: sbox[state] = 8'h8e;
        8'he7: sbox[state] = 8'h94;
        8'he8: sbox[state] = 8'h9b;
        8'he9: sbox[state] = 8'h1e;
        8'hea: sbox[state] = 8'h87;
        8'heb: sbox[state] = 8'he9;
        8'hec: sbox[state] = 8'hce;
        8'hed: sbox[state] = 8'h55;
        8'hee: sbox[state] = 8'h28;
        8'hef: sbox[state] = 8'hdf;
        8'hf0: sbox[state] = 8'h8c;
        8'hf1: sbox[state] = 8'ha1;
        8'hf2: sbox[state] = 8'h89;
        8'hf3: sbox[state] = 8'h0d;
        8'hf4: sbox[state] = 8'hbf;
        8'hf5: sbox[state] = 8'he6;
        8'hf6: sbox[state] = 8'h42;
        8'hf7: sbox[state] = 8'h68;
        8'hf8: sbox[state] = 8'h41;
        8'hf9: sbox[state] = 8'h99;
        8'hfa: sbox[state] = 8'h2d;
        8'hfb: sbox[state] = 8'h0f;
        8'hfc: sbox[state] = 8'hb0;
        8'hfd: sbox[state] = 8'h54;
        8'hfe: sbox[state] = 8'hbb;
        8'hff: sbox[state] = 8'h16;
        
        default: sbox[state] = 8'hxx; // Default value in case of fault 
    endcase
  end
    
    // Assign the output value from the ROM based on the input state
always @(posedge clk)
begin
    Sstate = sbox[state];
end

endmodule
