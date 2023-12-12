`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2023 17:32:30
// Design Name: 
// Module Name: tb_shiftRows
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


module tb_shiftRows;

    reg clk = 0;
    reg [7:0] data_in = 8'b10101010;
    wire [7:0] data_out;

    shiftRows UUT (
        .clk(clk),
        .data_in(data_in),
        .data_out(data_out)
    );
    
    always #5 clk = !clk;
    
    initial begin
    
        $display("Starting Test!");
        
        $display(data_in);
        $display(data_out);
        
    end
    

endmodule
