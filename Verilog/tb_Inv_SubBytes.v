`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Test bench for Inv SubBytes module 
//written by K Sikorsk 
//////////////////////////////////////////////////////////////////////////////////


module tb_Inv_SubBytes;

//Input/output declarations
reg[127:0] message; 
wire[127:0] Dmessage;

Inv_SubBytes UUT (
// create a module instatiation of the UUT verilog module 
//and connect testbench signals to the UUT ports 
.message(message),
.Dmessage(Dmessage)
);

//Test stimulus
initial begin
  
  $display("Starting Test!");
   //Input data:
   //message = 128'h0123456789ABCDEF0123456789ABCDEF;
   message = 128'h7c266e85a762bddf7c266e85a762bddf;
    // Display initial input
    $display("Input Data: %h", message);
    
    #10; // Wait for 10 time units
    // Display the result
    $display("Output Result: %h", Dmessage);
    //end simulatio
    $finish;
    end
endmodule
