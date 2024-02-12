`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Test bench for inverse Sbox 
// Written by K Sikorski
//////////////////////////////////////////////////////////////////////////////////


module tb_Inv_Sbox;
reg[7:0] state;
//Wire for output Sstate of UUT 
wire[7:0] Sstate; 

Inv_Sbox UUT(
// create a module instatiation of the UUT verilog module 
//and connect testbench signals to the UUT ports 
 .state(state),
 .Sstate(Sstate)
 );
 
 //Test stimulus
initial begin
  
  $display("Starting Test!");
  state = 8'h04;
   #10;// allow some simulation time 
  //display values:
   $display("Input: %h, Output: %h", state, Sstate);
   state = 8'h46;
   #10;// allow some simulation time 
  //display values:
   $display("Input: %h, Output: %h", state, Sstate);
    state = 8'hdf;
   #10;// allow some simulation time 
  //display values:
   $display("Input: %h, Output: %h", state, Sstate);
   //finish the simulation 
   $finish;
end
endmodule
