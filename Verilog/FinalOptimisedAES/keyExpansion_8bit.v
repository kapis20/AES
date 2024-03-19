`timescale 1ns/1ps

//Key Expansion Unit based upon the datapath design by Hamalainen
module keyExpansion_8bit(input_key, r_key, clk, rcount, select_input, select_sbox, select_last_out, select_bit_out, rcon_en);
    
    //define inputs and outputs
    input [7:0] input_key, rcon_en;
    input [3:0] rcount;
    input clk, select_input, select_sbox, select_last_out, select_bit_out;
    output [7:0] r_key;

    //define registers and wires that are part of the datapath
    reg [7:0] r15, r14, r13, r12, r11, r10, r9, r8, r7, r6, r5, r4, r3, r2, r1, r0, r_sbox;
    wire [7:0] input_s, output_s, output_r, output_rs, rcon, output_mux1, output_mux3, input_mux3, input_mux4;

    //get round constant value using the function get_rcon
    assign rcon = get_rcon(rcount);

    //calculate outputs/inputs for other parts from various logic gates
    assign output_rs = output_s ^ output_r;
    assign output_r = rcon_en & rcon;
    assign input_mux3 = r4 ^ r_key;
    assign input_mux4 = r0 ^ output_rs;

    //shift registers along at the start of each clock cycle, assign some with mux outputs
    always @ (posedge clk) begin
        r15 <= output_mux1;
        r14 <= r15;
        r13 <= r14;
        r12 <= r13;
        r11 <= r12;
        r10 <= r11;
        r9 <= r10;
        r8 <= r9;
        r7 <= r8;
        r6 <= r7;
        r5 <= r6;
        r4 <= r5;
        r3 <= output_mux3;
        r2 <= r3;
        r1 <= r2;
        r0 <= r1;
        //if rcon is enabled, set the register going into the sbox to be the value of register 12
        if (rcon_en == 8'b11111111) begin
            r_sbox <= r12;
        end
    end
    
    //function to get the round constant depending on the current round
    function [7:0] get_rcon;
      input [3:0] round;
        case (round)
          0: get_rcon = 8'h01;
          1: get_rcon = 8'h02;
          2: get_rcon = 8'h04;
          3: get_rcon = 8'h08;
          4: get_rcon = 8'h10;
          5: get_rcon = 8'h20;
          6: get_rcon = 8'h40;
          7: get_rcon = 8'h80;
          8: get_rcon = 8'h1b;
          9: get_rcon = 8'h36;
          default: get_rcon = 8'h01;
        endcase
    endfunction
    
    //mux modules to get outputs in the same clock cycle
    mux2_1_8 mux_in (input_key, r_key, output_mux1, select_input);
    mux2_1_8 mux_sbox (r_sbox, r13, input_s, select_sbox); 
    mux2_1_8 mux_bit (r4, input_mux3, output_mux3, select_bit_out); 
    mux2_1_8 mux_last_out (input_mux4, r0, r_key, select_last_out);
    //sbox module
    SubBytes sbox (input_s, clk, output_s);
    
endmodule