`timescale 1ns / 1ps

// Testbench which tests both shift rows algorithms - encrypts and then decrypts
// Written by C. Baldwin
module tb_shiftRows;

    // Declare inputs
    reg clk = 0;
    reg [127:0] data_in = 128'h0123456789ABCDEF0123456789ABCDEF;
    reg [127:0] data_in_i;
    
    // Declare outputs
    wire [127:0] data_out;
    wire [127:0] data_out_i;

    // Instatiate UUTs - UUT_1 = encrypt, UUT_2 = decrypt
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
    
    // Initialise clock
    always #5 clk = !clk;
    
    initial begin
    
        $display("Starting Test!");
        
        $display("===ENCRYPT===");
        $display("Data In:  %h", data_in);  
        #10
        $display("Data Out: %h", data_out);
        
        // send output data from encrypt to input data for decrypt
        data_in_i = data_out;
        
        $display("===DECRYPT===");
        $display("Data In:  %h", data_in_i);  
        #10
        $display("Data Out: %h", data_out_i);
        
        // Confirm that both modules are capable of doing the inverse of one another
        if (data_in == data_out_i) begin
            $display("Input = Output");
        end
        
        $display("Test Complete!");
        
        $finish;
    end
    

endmodule
