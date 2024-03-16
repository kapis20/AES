`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2024 15:51:09
// Design Name: 
// Module Name: top
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


module top(in, clock, enable, key, message);

parameter IDLE = 0, XOR = 1, SUBBYTE =2;


input [7:0] in, key;
input clock, enable;
output [127:0] message;

//FSM States
reg [2:0] currentState =IDLE; 
reg [2:0] nextState = IDLE;

//counters
reg [3:0] counter_XOR = 0;

//temp results
reg [127:0] temp_XOR = 0;

always@(posedge clock)begin
currentState <= nextState;
//end

//always@(*)begin
case (currentState)
    IDLE: begin
    if (enable == 1)begin
    nextState <= XOR;
    end else begin
    nextState <= IDLE;
    end
    end
    
    XOR: begin
    counter_XOR <= counter_XOR +1;
    
    temp_XOR [7:0] <= in ^ key;
    temp_XOR [15:8] <= temp_XOR [7:0];
    temp_XOR [23:16] <= temp_XOR [15:8];
    temp_XOR [31:24] <= temp_XOR [23:16];
    temp_XOR [39:32] <= temp_XOR [31:24];
    temp_XOR [47:40] <= temp_XOR [39:32];
    temp_XOR [55:48] <= temp_XOR [47:40];
    temp_XOR [63:56] <= temp_XOR [55:48];
    temp_XOR [71:64] <= temp_XOR [63:56];
    temp_XOR [79:72] <= temp_XOR [71:64];
    temp_XOR [87:80] <= temp_XOR [79:72];
    temp_XOR [95:88] <= temp_XOR [87:80];
    temp_XOR [103:96] <= temp_XOR [95:88];
    temp_XOR [111:104] <= temp_XOR [103:96];
    temp_XOR [119:112] <= temp_XOR [111:104];
    temp_XOR [127:120] <= temp_XOR [119:112];
    
    
    if (counter_XOR == 15)begin
    nextState <= SUBBYTE;
    counter_XOR <= 0;
    end else begin
    nextState <= XOR;
    end
    end 
    
    SUBBYTE: begin
    temp_XOR <= temp_XOR;
    nextState <= SUBBYTE;
    end
    endcase
    
    end
    
    
    
    assign message = temp_XOR;
    
    
    
    
    



endmodule
