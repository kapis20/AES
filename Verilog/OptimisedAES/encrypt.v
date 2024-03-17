`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2024 02:13:45
// Design Name: 
// Module Name: encryption
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


module encrypt(in, clock, enable, key, message);

parameter IDLE = 0, XOR = 1, SUBBYTE = 2, SHIFTROWS = 3, MIXCOLUMNS = 4;


input [7:0] in, key;
input clock, enable;
output reg [127:0] message=0;

//FSM States
reg [2:0] currentState =IDLE; 
reg [2:0] nextState = IDLE;

//keep track of the number of rounds
//reg [3:0] round = 0;

//output ready signal when round == 10
//output ready = 0;

//counter
reg [5:0] counter = 0;

//temp results
reg [7:0] temp = 0;

//variables to store the output from the sub-modules
wire [7:0] Sstate;
wire [7:0] SR;
wire ready_sr = 0;
wire [7:0] MC;

//input to submodules
reg [7:0] temp;

//enable for submodule
reg en_SR = 0;
reg [7:0] en_MC = 0;
reg ready_MC = 0;


//instantiate the sub-modules
SubBytes sb (.state(temp), .clk(clock), .Sstate(Sstate));
//SubBytes inst1 (.state(message[127:120]), .clk(clock), .Sstate(Sstate));
shiftrows sr (.clock(clock), .enable(en_SR), .inbyte(temp), .ready(ready_sr), .outbyte(SR));
mixColumns mc (.clock(clock), .enable(en_MC), .ready(ready_MC), .in_byte(temp), .out_byte(MC));


always@(posedge clock)begin
//increment counter every clock cycle when enable is 1
    if (enable == 1)begin
        counter <= counter +1;
    end
    
//assign register values for the message. Update it with the temp value
    //message [7:0] <= temp;
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
    IDLE: begin
    if (enable == 1)begin
    currentState <= XOR;
    end else begin
    message <= message;
    currentState <= IDLE;
    end
    end
    
    XOR: begin
    message [7:0] <= in ^ key;
    
    if (counter == 17)begin
    counter <= 0;
    currentState <= SUBBYTE;
    end
    end
    
    SUBBYTE: begin
    currentState <= SUBBYTE;
    message[7:0] <= Sstate;
    
    if (counter == 16)begin
    counter <= 0;
    currentState <= SHIFTROWS;
    end
    end
    
    
    
    SHIFTROWS: begin
    currentState <= SHIFTROWS;
    en_SR <=1;
    if (counter > 12) begin
    message [7:0] <= SR;
    end else begin 
    message [7:0] <=0;
    end
    
    if (counter == 29)begin
    counter <= 0;
    currentState <= MIXCOLUMNS;
    en_SR <=0;
    end
    end
    
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
    currentState <= IDLE;
    end
    end
   
    
    
    endcase
    end
    

endmodule