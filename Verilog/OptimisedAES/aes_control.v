`timescale 1ns/1ps

//controller for key expansion based on Hamalainen's Datapath design
module key_expansion_control (rst, clk, input_key, input_mixCol, outputByte,outputKey, output_key128);

    //declare inputs
    input rst, clk;
    input [7:0] input_key;
    input [127:0] input_mixCol;
    output reg [7:0] outputByte;
    output reg [127:0] output_key128;
    output reg [7:0] outputKey;
    //output reg [3:0] round; 
    
    //delcare registers, wires and parameters
    reg select_input, select_sbox, select_last_out, select_bit_out, done=0;
    reg [7:0] rcon_en, round_count, roundMixColcounter =0;
    reg [3:0] fsm_count, roundMixCol=0;
    reg [3:0] counterTemp =0,Temp, round;
    reg [2:0] state,state2;
    reg [127:0] outputKeyTemp; // register to store rounds output 
    reg [127:0] output_keys [0:9];
    reg [127:0] inputMixCol;
    wire [3:0] round_count_ke; //separate round counter for the key expansion module
    wire [7:0] round_key;
    wire [7:0] output_key8;
    parameter LOAD = 0, ONE = 1, TWO = 2, THREE = 3, NORM = 4, SHIFT = 5; //params used for FSM to control input signals
    parameter WAIT = 6, ENCRYPT = 7;
    keyExpansion_8bit keyExpansion (input_key, round_key, clk, round_count_ke, select_input, select_sbox, select_last_out, select_bit_out, rcon_en);
    
    assign round_count_ke = round_count[7:4];
    assign output_key8 = round_key;
    
    //FSM used to control the current state, which are determined by the number of clock cycles required to complete the state
    always @ (posedge clk) begin
    
        counterTemp <= counterTemp+1;
        
        if (rst == 1) begin
            state <= LOAD;
            fsm_count <= 0;
        end
        else begin
        
            case (state)
                LOAD: //load input key into the key expansion unit. Stop when there have been 16 clock cycles (i.e. registers are full)
                begin
                    fsm_count <= fsm_count + 1;
                    if (fsm_count == 15) begin
                        state <= ONE;
                        fsm_count <= 0;
                    end
                end

                ONE: //complete the first state of calculations
                begin
                    state <= TWO;
                    fsm_count <= 0;
                end

                TWO: //complete state two of calculations. Requires 2 clock cycles to complete
                begin
                    fsm_count <= fsm_count + 1;
                    if (fsm_count == 1) begin
                        state <= THREE;
                        fsm_count <= 0;
                    end
                end
                
                THREE: //complete the third state of calculations
                begin
                    state <= NORM;
                    fsm_count <= 0;
                end

                NORM: //calculate columns
                begin
                    fsm_count <= fsm_count + 1;
                    if(fsm_count == 7) begin
                        state <= SHIFT;
                        fsm_count <= 0;
                    end
                end

                SHIFT: //shift all bits along by four bits before starting the cycle again
                begin
                    fsm_count <= fsm_count + 1;
                    if(fsm_count == 3) begin
                        state <= ONE;
                        fsm_count <= 0;
                    end
                end
            endcase
        end
        
        if (rst == 1 || fsm_count == 15 || round_count_ke == 10) begin //reset round count if the cycle is reached or if the round count reaches 10
            round_count <= 0;
        end
        else begin
            round_count <= round_count + 1; //else increment the round count
        end
         
        // store each byte in LSB and shift left each cycle by one byte
        outputKeyTemp <= outputKeyTemp << 8; 
        outputKeyTemp[7:0] <= output_key8;   
        // done singal assigned to 1 so when all rounds are done we don't store any more keys 
        if (round_count_ke ==10) begin 
            done <=1;
        end
        
        if (done == 0) begin   
            if (counterTemp == 0) begin
//round <= round_count_ke + 1;
              round <= round_count_ke;
              //Temp <= round;
              end 
            else if ( counterTemp == 1) begin
              //output_key128 <= outputKeyTemp;
               case (round)
              // array to store all keys 
              8'h00: output_keys[round] = outputKeyTemp;
              8'h01: output_keys[round] = outputKeyTemp;
              8'h02: output_keys[round] = outputKeyTemp;
              8'h03: output_keys[round] = outputKeyTemp;
              8'h04: output_keys[round] = outputKeyTemp;
              8'h05: output_keys[round] = outputKeyTemp;
              8'h06: output_keys[round] = outputKeyTemp;
              8'h07: output_keys[round] = outputKeyTemp;
              8'h08: output_keys[round] = outputKeyTemp;
              8'h09: output_keys[round] = outputKeyTemp;
              
              endcase 
                end
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

            ONE: //allow rcon to be calculated, allow round_key value to use used. Block new key input
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
    
    always @(posedge clk)begin
    roundMixColcounter <= roundMixColcounter +1;
    if (roundMixColcounter == 80) begin
    inputMixCol = input_mixCol;
    roundMixCol = roundMixCol +1;
    roundMixColcounter <=0;
    end 
    
    if (roundMixCol > 0 && roundMixCol <11) begin
    outputByte <= inputMixCol[127:120];
    inputMixCol <= inputMixCol <<8;
    outputKey <= output_keys[roundMixCol-1][127:120];
    output_keys[roundMixCol-1] <= output_keys[roundMixCol-1] <<8;
    
    end   
    end

endmodule