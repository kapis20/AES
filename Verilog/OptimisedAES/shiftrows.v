`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 14:10:44
// Design Name: 
// Module Name: shiftrows
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


module shiftrows(
input [7:0] inBits,
input clk,
//input [1:0] control, 
output reg [7:0] outBits,
output reg ready);

parameter IDLE = 0, ONE = 1, TWO =2, THREE =3, FOUR = 4, FIVE =5, SIX =6, SEVEN =7;

integer counter =0;
wire [7:0] SRL_output;
wire [7:0] SRL_output2;
wire [7:0] mux1_output;
reg [1:0] control =0;

reg [2:0] currentState =IDLE; 
reg [2:0] nextState;

always @ (posedge clk)begin
counter <= counter +1;
currentState <= nextState; 
end

always@(*) begin
case (currentState)
    IDLE: begin
        if (counter> 12) begin
            nextState <=ONE;
        end
    ready <= 0;
    control <=0;
    end
    
    ONE: begin
    control <= 4'b0010;
    ready <=1;
    if (counter == 24) begin
    nextState <= FIVE;
    end else begin
    nextState <= TWO;
    end
    end
    
    TWO: begin
    control <= 4'b0001;
    ready <=1;
    if (counter == 9) begin
    nextState <= SIX;
    end else begin
    nextState <= THREE;
    end
    end
    
    THREE: begin
    control <= 4'b0000;
    ready <=1;
    if (counter == 14) begin
    nextState <= FOUR;
    end else begin
    nextState <= SEVEN;
    end
    end
    
    FOUR: begin
    control <= 4'b0011;
    ready <=1;
    if (counter == 27) begin
    counter <= 12;
    nextState <= ONE;
    end else begin
    nextState <= ONE;
    end
    end
    
    FIVE: begin
    control <= 4'b0101;
    ready <=1;
    nextState <= SIX;
   end
    
    SIX: begin
    control <= 4'b0100;
    ready <=1;
    nextState <= FOUR;
    end
    
    SEVEN: begin
    control <= 4'b1000;
    ready <=1;
    nextState <= ONE;
   end
    
endcase
end
    
    


// SRL16E: 16-bit shift register LUT with clock enable operating
//         on posedge of clock (Mapped to a SliceM LUT6)
//         7 Series
// Xilinx HDL Language Template, version 2021.2

SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_ONE (
   .Q(SRL_output[0] ),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(inBits[0] )        // SRL data input
);

SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_TWO (
   .Q(SRL_output[1] ),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(inBits[1] )        // SRL data input
);


SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_THREE (
   .Q(SRL_output[2]),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(inBits[2])        // SRL data input
);


SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_FOUR (
   .Q(SRL_output[3] ),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(inBits[3])        // SRL data input
);


SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_FIVE (
   .Q(SRL_output[4] ),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(inBits[4])        // SRL data input
);


SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_SIX (
   .Q(SRL_output[5] ),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(inBits[5])        // SRL data input
);


SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_SEVEN (
   .Q(SRL_output[6] ),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(inBits[6])        // SRL data input
);


SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_EIGHT (
   .Q(SRL_output[7] ),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(inBits[7])        // SRL data input
);
/////////////////////////////////////////////////////////////////////////////
// second register SRL16
SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_R2_ONE (
   .Q(SRL_output2[0]),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(SRL16E_ONE.Q[15])        // SRL data input
);

SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_R2_TWO (
   .Q(SRL_output2[1] ),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(SRL16E_TWO.Q[15])        // SRL data input
);
SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_R2_THREE (
   .Q(SRL_output2[2] ),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(SRL16E_THREE.Q[15])        // SRL data input
);
SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_R2_FOUR (
   .Q(SRL_output2[3] ),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(SRL16E_FOUR.Q[15])        // SRL data input
);
SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_R2_FIVE (
   .Q(SRL_output2[4] ),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(SRL16E_FIVE.Q[15])        // SRL data input
);
SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_R2_SIX (
   .Q(SRL_output2[5] ),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(SRL16E_SIX.Q[15])        // SRL data input
);
SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_R2_SEVEN (
   .Q(SRL_output2[6] ),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(SRL16E_SEVEN.Q[15])        // SRL data input
);


SRL16E #(
   .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_R2_EIGHT (
   .Q(SRL_output2[7] ),       // SRL data output
   .A0(1),     // Select[0] input
   .A1(1),     // Select[1] input
   .A2(control[0] ),     // Select[2] input
   .A3(control[1]),     // Select[3] input
   .CE(1),     // Clock enable input
   .CLK(clk),   // Clock input
   .D(SSRL16E_EIGHT.Q[15])        // SRL data input
);





//mux2_1 mux0(SRL_output2[0],SRL_output[0],control[2] ,mux1_output[0]);
//mux2_1 mux1(SRL_output2[1],SRL_output[1],control[2] ,mux1_output[1]);
//mux2_1 mux2(SRL_output2[2],SRL_output[2],control[2] ,mux1_output[2]);
//mux2_1 mux3(SRL_output2[3],SRL_output[3],control[2] ,mux1_output[3]);
//mux2_1 mux4(SRL_output2[4],SRL_output[4],control[2] ,mux1_output[4]);
//mux2_1 mux5(SRL_output2[5],SRL_output[5],control[2] ,mux1_output[5]);
//mux2_1 mux6(SRL_output2[6],SRL_output[6],control[2] ,mux1_output[6]);
//mux2_1 mux7(SRL_output2[7],SRL_output[7],control[2] ,mux1_output[7]);

//mux2_1 mux_2_0(mux1_output[0],inBits[0],control[3], outBits[0]); 
//mux2_1 mux_2_1(mux1_output[1],inBits[1],control[3], outBits[1]); 
//mux2_1 mux_2_2(mux1_output[2],inBits[2],control[3], outBits[2]); 
//mux2_1 mux_2_3(mux1_output[3],inBits[3],control[3], outBits[3]); 
//mux2_1 mux_2_4(mux1_output[4],inBits[4],control[3], outBits[4]); 
//mux2_1 mux_2_5(mux1_output[5],inBits[5],control[3], outBits[5]); 
//mux2_1 mux_2_6(mux1_output[6],inBits[6],control[3], outBits[6]); 
//mux2_1 mux_2_7(mux1_output[7],inBits[7],control[3], outBits[7]); 
endmodule
