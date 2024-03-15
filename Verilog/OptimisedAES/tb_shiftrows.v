`timescale 1ns / 1ps                                                              
//////////////////////////////////////////////////////////////////////////////////
// Company:                                                                       
// Engineer:                                                                      
//                                                                                
// Create Date: 14.03.2024 23:18:33                                               
// Design Name:                                                                   
// Module Name: tb_shiftrows                                                      
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
                                                                                  
                                                                                  
module tb_shiftrows();                                                            
  // Input signals                                                                
  reg clk=0;                                                                      
  reg [7:0] inBits;                                                               
                                                                                  
  // Output signals                                                               
  wire [7:0] outBits;                                                             
  wire ready;                                                                     
                                                                                  
  // Instantiate the shiftrows module                                             
  shiftrows UUT (.clock (clk), .inbyte(inBits), .outbyte(outBits), .ready(ready));
                                                                                  
  // Clock generation                                                             
  always begin                                                                    
    #5 clk = ~clk;                                                                
  end                                                                             
                                                                                  
  initial begin                                                                   
    #5                                                                            
    inBits = 8'b11010100; //d4                                                    
    #10                                                                           
    inBits = 8'b00100111; //27                                                    
    #10                                                                           
    inBits = 8'b00010001; //11                                                    
    #10                                                                           
    inBits = 8'b10101110; //ae                                                    
                                                                                  
                                                                                  
    #10                                                                           
    inBits = 8'b11100000; //e0                                                    
    #10                                                                           
    inBits = 8'b10111111; //bf                                                    
    #10                                                                           
    inBits = 8'b10011000; //98                                                    
    #10                                                                           
    inBits = 8'b11110001; //f1                                                    
                                                                                  
                                                                                  
                                                                                  
                                                                                  
    #10                                                                           
    inBits = 8'b10111000; //b8                                                    
    #10                                                                           
    inBits = 8'b10110100; //b4                                                    
    #10                                                                           
    inBits = 8'b01011101; //5d                                                    
    #10                                                                           
    inBits = 8'b11100101; //e5                                                    
                                                                                  
                                                                                  
                                                                                  
                                                                                  
    #10                                                                           
    inBits = 8'b00011110; //1e                                                    
    #10                                                                           
    inBits = 8'b01000001; //41                                                    
    #10                                                                           
    inBits = 8'b01010010; //52                                                    
    #10                                                                           
    inBits = 8'b00110000; //30                                                    
                                                                                  
    #100                                                                          
                                                                                  
                                                                                  
                                                                                  
                                                                                  
                                                                                  
                                                                                  
                                                                                  
                                                                                  
    $finish;                                                                      
  end                                                                             
                                                                                  
  /*                                                                              
  // Monitor signals                                                              
  always @(posedge clk) begin                                                     
    if (ready) begin                                                              
      $display("Input:  %b, Output: %b", inBits, outBits);                        
    end                                                                           
  end                                                                             
  */                                                                              
endmodule                                                                         
