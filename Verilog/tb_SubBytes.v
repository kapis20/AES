`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//Test bench for SubBytes module 
//written by K Sikorsk 
//////////////////////////////////////////////////////////////////////////////////


module tb_SubBytes();
//Input/output declarations
reg[127:0] message; 
wire[127:0] Emessage;

// Instantiate the subbytes module

SubBytes UUT(
// create a module instatiation of the UUT verilog module 
//and connect testbench signals to the UUT ports 
.message(message),
.Emessage(Emessage)
);

//Test stimulus
initial begin
  
  $display("Starting Test!");
   //Input data:
   message = 128'h0123456789ABCDEF0123456789ABCDEF;
    // Display initial input
    $display("Input Data: %h", message);
    
    #10; // Wait for 10 time units
    // Display the result
    $display("Output Result: %h", Emessage);
    //end simulatio
    $finish;
    end
   
endmodule
