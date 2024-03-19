`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Boon Kean Teo
// Module Name: encrypt
// Project Name: AES (EEE6225)
//////////////////////////////////////////////////////////////////////////////////


module encrypt(in, clock, enable, key, message);

//defining the states for FSM
parameter IDLE = 0, XOR = 1, SUBBYTE = 2, SHIFTROWS = 3, MIXCOLUMNS = 4, XOR_RK = 5;

//defining input and output
input [7:0] in, key;
input clock, enable;
output reg [127:0] message=0;

//Current state of FSM
reg [2:0] currentState =IDLE; 

//counter to keep track of the number of rounds
reg [3:0] round = 0;

//counter
reg [5:0] counter = 0;

//temporary register to store the input to submodules
reg [7:0] temp = 0;

//temporary registers to store the output from the sub-modules
wire [7:0] Sstate;
wire [7:0] SR;
wire ready_sr = 0;
wire [7:0] MC;

//enable for submodule
reg en_SR = 0;
reg [7:0] en_MC = 0;
reg ready_MC = 0;


//instantiate the sub-modules
SubBytes sb (.state(temp), .clk(clock), .Sstate(Sstate));
shiftrows sr (.clock(clock), .enable(en_SR), .inbyte(temp), .ready(ready_sr), .outbyte(SR));
mixColumns mc (.clock(clock), .enable(en_MC), .ready(ready_MC), .in_byte(temp), .out_byte(MC));


always@(posedge clock)begin
//increment counter every clock cycle when enable is 1
    if (enable == 1)begin
        counter <= counter +1;
    end
    
//Left shift message by 1 byte every clock cycle. Also assign the last byte with temp, which holds output of modules instantiated
    message [15:8] <= message [7:0];
    message [23:16] <= message [15:8];
    message [31:24] <= message [23:16];
    message [39:32] <= message [31:24];
    message [47:40] <= message [39:32];
    message [55:48] <= message [47:40];
    message [63:56] <= message [55:48];
    message [71:64] <= message [63:56];
    message [79:72] <= message [71:64];
    message [87:80] <= message [79:72];
    message [95:88] <= message [87:80];
    message [103:96] <= message [95:88];
    message [111:104] <= message [103:96];
    message [119:112] <= message [111:104];
    message [127:120] <= message [119:112];
    temp <= message [127:120];
end

always@(*)begin
case (currentState)

    //Do nothing until enable turns high. Transitions to XOR state.
    IDLE: begin
    message <= message;
    if (enable == 1)begin
    currentState <= XOR;
    end else begin
    message <= message;
    counter <= 0;
    currentState <= IDLE;
    end
    end
    
    //This is the first XOR that computes XOR between original key and input
    XOR: begin
    message [7:0] <= in ^ key;
    
    if (counter == 17)begin
    counter <= 0;
    currentState <= SUBBYTE;
    end
    end
    

    //In this state, the temp is assigned to the output of SubByte module. Takes 16 clock cycles to complete because there are 16 bytes. 
    //Transitions to SHIFTROWS next
    SUBBYTE: begin
    currentState <= SUBBYTE;
    message[7:0] <= Sstate;
    
    if (counter == 16)begin
    counter <= 0;
    currentState <= SHIFTROWS;
    end
    end
    
    //In this state, the temp is assigned to the output of ShiftRows module. 
    //Takes 28 clock cycles to complete because there are 16 bytes and a latency of 12 clock cycles to load the registers.
    //Transitions to MIXCOLUMNS next
    SHIFTROWS: begin
    currentState <= SHIFTROWS;
    en_SR <=1;
    if (counter > 12) begin
    message [7:0] <= SR;
    end else begin 
    message [7:0] <=0;
    end
    
    if ((round == 9) && (counter == 29))begin
    counter <= 0;
    currentState <= XOR_RK;
    en_SR <=0;
    end else if (counter == 29)begin
    counter <= 0;
    currentState <= MIXCOLUMNS;
    en_SR <=0;
    end
    end
    

    //In this state, the temp is assigned to the output of MixColumns module. 
    //Takes 20 clock cycles to complete because there are 16 bytes and a latency of 4 clock cycles.
    //Transitions to XOR_RK next
    MIXCOLUMNS: begin
    currentState <=  MIXCOLUMNS;
    ready_MC <=1;
    if (counter > 3)begin
    message [7:0] <= MC;
    end else begin
    message [7:0] <= 0;
    end
    
    if ((counter == 0) || (counter == 4) || (counter == 8) || (counter == 12))begin
    en_MC = 8'b00000000;
    end else begin
    en_MC = 8'b11111111;
    end
    
    if (counter == 20)begin
    counter <= 0;
    ready_MC <=0;
    currentState <= XOR_RK;
    end
    end
    
    //This state is similar to XOR, but instead of XOR between input message and key, it XOR the temp (first byte of message) and input key (round key)
    //Transitions to the next round which starts again from SUBBYTE
    XOR_RK: begin
    message [7:0] <= temp ^ key;
    
    if (counter == 16)begin
    counter <= 0;
    currentState <= SUBBYTE;
    round <= round +1;
    end
    end
  
    endcase
    end
    

endmodule
