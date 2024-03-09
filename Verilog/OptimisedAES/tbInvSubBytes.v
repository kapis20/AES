`timescale 1ns / 1ps



module tb_InvSubBytes;

 // Inputs
  reg clk;
  reg [7:0] state;

  // Outputs
  wire [7:0] Sstate;
  
  // Instantiate the Sbox1 module
  InvSubBytes UUT (
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
