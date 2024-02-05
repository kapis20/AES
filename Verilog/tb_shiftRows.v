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
    
    reg [127:0] data_in = 128'b00001111000011110000111100001111_10010000110011111001000011001111_00001111000011110000111100001111_10010000110011111001000011001111;
    wire [127:0] data_out;
    
    reg [127:0] data_in_i;
    wire [127:0] data_out_i;

    shiftRows UUT_1 (
        .clk(clk),
        .data_in(data_in),
        .data_out(data_out)
    );
    
    invShiftRows UUT_2 (
        .clk(clk),
        .data_in(data_in_i),
        .data_out(data_out_i)
    );
    
    always #5 clk = !clk;
    
    initial begin
    
        $display("Starting Test!");
        
        $display("===ENCRYPT===");
        $display("Data In:  %b", data_in);  
        #10
        $display("Data Out: %b", data_out);
        
        data_in_i = data_out;
        
        $display("===DECRYPT===");
        $display("Data In:  %b", data_in_i);  
        #10
        $display("Data Out: %b", data_out_i);
        
        if (data_in == data_out_i) begin
            $display("Input = Output");
        end
        
        
        $display("Test Complete!");
        
    end
    

endmodule
