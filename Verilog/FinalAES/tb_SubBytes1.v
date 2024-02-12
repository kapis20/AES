`timescale 1ns / 1ps


// Test bench for SubBytes and Inv_SubBytes modules
// written by K Sikorski

//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////


module tb_SubBytes1();

// Input/output declarations
reg[127:0] message;
wire[127:0] Emessage, Dmessage;

// Instantiate the SubBytes and Inv_SubBytes modules
SubBytes UUT_SubBytes(
    .message(message),
    .Emessage(Emessage)
);

Inv_SubBytes UUT_Inv_SubBytes(
    .message(Emessage),
    .Dmessage(Dmessage)
);

// Test stimulus
initial begin

    $display("Starting Test for SubBytes:");
    $display("===ENCRYPT===");
    // Input data for SubBytes
    message = 128'h0123456789ABCDEF0123456789ABCDEF;
    // Display initial input
    $display("Input Data for SubBytes: %h", message);
    
    #10; // Wait for 10 time units
    // Display the result
    $display("Output Result for SubBytes: %h", Emessage);
    
    $display("Starting Test for Inv_SubBytes:");
    // Display initial input
    $display("Input Data for Inv_SubBytes: %h", Emessage);
    
    #10; // Wait for 10 time units
    // Display the result
    $display("Output Result for Inv_SubBytes: %h", Dmessage);
    
    // Confirm that both modules are capable of doing the inverse of one another
        if (message == Dmessage) begin
            $display("Input = Output");
        end
    
    $finish;
end


endmodule
