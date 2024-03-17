`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2024 13:10:40
// Design Name: 
// Module Name: tb_subbytes
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


`timescale 1ns / 1ps



module tb_subbytes;

 // Inputs
  reg clk;
  reg [7:0] state;

  // Outputs
  wire [7:0] Sstate;
  
  // Instantiate the Sbox1 module
 SubBytes UUT (
    .clk(clk),
    .state(state),
    .Sstate(Sstate)
  );
  
    // Clock generation
  always begin
    #5 clk = ~clk;
  end

  initial begin
    // Initialize clock
    clk = 0;
    
    
    // Apply all possible input values
    state = 8'h00;
    #10;
    state = 8'h01;
    #10;
    state = 8'h02;
    #10;
    // ... (repeat for all possible state values)
    state = 8'hff;
    #10;
    state = 8'h4f;
    #10;

    $finish;
  end

  // Monitor the output
  always @(posedge clk) begin
  #5;
    $display("Next output");
    $display("state = %h, Sstate = %h", state, Sstate);
  end

endmodule