`timescale 1ns/1ps

//controller for key expansion based on Hamalainen's Datapath design
module key_expansion_control (rst, clk, input_key, output_key, output_key1, round);
    //declare inputs
    input rst, clk;
    input [7:0] input_key;
    output [7:0] output_key;
    output reg [127:0] output_key1;
    output reg [3:0] round; 
    //delcare registers, wires and parameters
    reg select_input, select_sbox, select_last_out, select_bit_out, done=0;
    reg [7:0] rcon_en, round_count;
    reg [3:0] count;
    reg [3:0] counterTemp =0;
    reg [2:0] state;
    //reg [127:0] output_keys [0:9];
    reg [127:0] outputKeyTemp; // register to store rounds output 
    wire [3:0] round_count_ke; //separate round counter for the key expansion module
    wire [7:0] delayed_rkey;
    wire [7:0] last_rkey;
    parameter LOAD = 0, ONE = 1, TWO = 2, THREE = 3, NORM = 4, SHIFT = 5; //params used for FSM to control input signals

    assign round_count_ke = round_count[7:4];

    keyExpansion_8bit keyExpansion (input_key, delayed_rkey, last_rkey, clk, round_count_ke, select_input, select_sbox, select_last_out, select_bit_out, rcon_en);
    assign output_key = last_rkey;
    
    always @(negedge clk) begin
    // store each byte in LSB and shift left each cycle by one byte
       outputKeyTemp <= outputKeyTemp <<8; 
       outputKeyTemp[7:0] <= output_key;   
       // done singal assigned to 1 so when all rounds are done we don't store any more keys 
       if (round_count_ke ==10) begin 
            done <=1;
            end
       if (done == 0) begin   
            if (counterTemp == 0) begin
              round <= round_count_ke;
              
              end else if ( counterTemp== 1) begin
              output_key1 <= outputKeyTemp;
//            case (Temp)
//              // array to store all keys 
//              8'h00: output_keys[Temp] = outputKeyTemp;
//              8'h01: output_keys[Temp] = outputKeyTemp;
//              8'h02: output_keys[Temp] = outputKeyTemp;
//              8'h03: output_keys[Temp] = outputKeyTemp;
//              8'h04: output_keys[Temp] = outputKeyTemp;
//              8'h05: output_keys[Temp] = outputKeyTemp;
//              8'h06: output_keys[Temp] = outputKeyTemp;
//              8'h07: output_keys[Temp] = outputKeyTemp;
//              8'h08: output_keys[Temp] = outputKeyTemp;
//              8'h09: output_keys[Temp] = outputKeyTemp;
         
        
//        endcase
        end
        end
    end
    //FSM used to control the current state, which are determined by the number of clock cycles required to complete the state
    always @ (posedge clk) begin
        counterTemp <= counterTemp+1;
        if (rst == 1) begin
            state <= LOAD;
            count <= 0;
        end
        else begin
        
            case (state)
                LOAD: //load input key into the key expansion unit. Stop when there have been 16 clock cycles (i.e. registers are full)
                begin
                    count <= count + 1;
                    if (count == 15) begin
                        state <= ONE;
                        count <= 0;
                    end
                end

                ONE: //complete the first state of calculations
                begin
                    state <= TWO;
                    count <= 0;
                end

                TWO: //complete state two of calculations. Requires 2 clock cycles to complete
                begin
                    count <= count + 1;
                    if (count == 1) begin
                        state <= THREE;
                        count <= 0;
                    end
                end
                
                THREE: //complete the third state of calculations
                begin
                    state <= NORM;
                    count <= 0;
                end

                NORM: //calculate columns
                begin
                    count <= count + 1;
                    if(count == 7) begin
                        state <= SHIFT;
                        count <= 0;
                    end
                end

                SHIFT: //shift all bits along by four bits before starting the cycle again
                begin
                    count <= count + 1;
                    if(count == 3) begin
                        state <= ONE;
                        count <= 0;
                    end
                end
            endcase
        end
        
        if (rst == 1 || count == 15 || round_count_ke == 10) begin //reset round count if the cycle is reached or if the round count reaches 10
            round_count <= 0;
        end
        else begin
            round_count <= round_count + 1; //else increment the round count
        end
        
    end

    //mux select and rcon enable for key schedule
    always @ (*)
    begin
        case(state)
            LOAD: //allow for key input using select_input 
            begin
                select_input <= 0;
                select_sbox <= 1;
                select_last_out <= 0;
                select_bit_out <= 0;
                rcon_en <= 0;
            end

            ONE: //allow rcon to be calculated, allow last_key value to use used. Block new key input
            begin
                select_input <= 1;
                select_sbox <= 1;
                select_last_out <= 0;
                select_bit_out <= 1;
                rcon_en <= 8'b11111111;
            end
                 
            TWO: //same as state one but block rcon, so no new round constant can be calculated
            begin
                select_input <= 1;
                select_sbox <= 1;
                select_last_out <= 0;
                select_bit_out <= 1;
                rcon_en <= 0;
            end

            THREE: //updated from two to select sbox register contents instead of r13
            begin
                select_input <= 1;
                select_sbox <= 0;
                select_last_out <= 0;
                select_bit_out <= 1;
                rcon_en <= 0;
            end

            NORM: //enable last out to use r0 register
            begin
                select_input <= 1;
                select_sbox <= 0;
                select_last_out <= 1;
                select_bit_out <= 1;
                rcon_en <= 0;
            end

            SHIFT: //disable bit_out, meaning that the bits are simply shifted
            begin
                select_input <= 1;
                select_sbox <= 0;
                select_last_out <= 1;
                select_bit_out <= 0;
                rcon_en <= 0;
            end

            default: //default value in case of error
            begin
                select_input <= 0;
                select_sbox <= 1;
                select_last_out <= 0;
                select_bit_out <= 0;
                rcon_en <= 0;
            end
        endcase
    end

endmodule