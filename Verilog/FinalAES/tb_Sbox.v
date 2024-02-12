`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Test bench for Sbox 
// Written by K Sikorski
//////////////////////////////////////////////////////////////////////////////////


module tb_Sbox;

// register to drive input state of the UUT
reg[7:0] state;
//Wire for output Sstate of UUT 
wire[7:0] Sstate; 

Sbox UUT(
// create a module instatiation of the UUT verilog module 
//and connect testbench signals to the UUT ports 
 .state(state),
 .Sstate(Sstate)
 );
 
 //Test stimulus
initial begin
  
  $display("Starting Test!");
  //state =  8'h01;
  
  //define an array of test cases: 
  //reg [7:0] test_cases [0:4];
 //assign {test_cases[0], test_cases[1], test_cases[2], test_cases[3], test_cases[4]}={8'h01, 8'h0a, 8'h4f, 8'h55, 8'hd0};
  //get number of test cases 
  //int num_test_cases = $size(test_cases);
  // iterate through each test case in for loop
   //for (int i=0; i < num_test_cases; i = i+1) begin
   state = 8'h01;
   #10;// allow some simulation time 
  //display values:
   $display("Input: %h, Output: %h", state, Sstate);
   state = 8'h0a;
   #10;// allow some simulation time 
  //display values:
   $display("Input: %h, Output: %h", state, Sstate);
    state = 8'h4f;
   #10;// allow some simulation time 
  //display values:
   $display("Input: %h, Output: %h", state, Sstate);
   //finish the simulation 
   $finish;
end

endmodule
