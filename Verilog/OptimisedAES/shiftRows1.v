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


module shiftRows1(
input [7:0] inBits,
input clk,
//input [1:0] control, 
output [7:0] outBits,
output reg ready);

parameter IDLE = 0, ONE = 1, TWO =2, THREE =3, FOUR = 4, FIVE =5, SIX =6, SEVEN =7;

reg [6:0] counter =0;
wire [7:0] SRL_output;
wire [7:0] SRL_output2;
wire [7:0] mux1_output;
wire [7:0] Q15_output;
reg [1:0] control =0;

reg [2:0] currentState =IDLE; 
reg [2:0] nextState = IDLE;

always @ (posedge clk) begin
    if (counter > 27)begin
        counter <= 12;
   end else begin
        counter <= counter + 1'b1;
    end
    
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


 defparam
//Shift Register initialization ("0" by default) for functional simulation:
U_SRLC16E_ONE.INIT = 16'h0000;
defparam
U_SRLC16E_TWO.INIT = 16'h0000;

defparam
U_SRLC16E_THREE.INIT = 16'h0000;

defparam
U_SRLC16E_FOUR.INIT = 16'h0000;

defparam
U_SRLC16E_FIVE.INIT = 16'h0000;

defparam
U_SRLC16E_SIX.INIT = 16'h0000;

defparam
U_SRLC16E_SEVEN.INIT = 16'h0000;

defparam
U_SRLC16E_EIGHT.INIT = 16'h0000;

SRLC16E U_SRLC16E_ONE( .D(inBits[0]),
.A0(1),
.A1(1),
.A2(control[0]),
.A3(control[1]),
.CLK(clk),
.CE(1),
.Q(SRL_output[0]),
.Q15(Q15_output[0])
 );

SRLC16E U_SRLC16E_TWO ( .D(inBits[1]),
.A0(1),
.A1(1),
.A2(control[0]),
.A3(control[1]),
.CLK(clk),
.CE(1),
.Q(SRL_output[1]),
.Q15(Q15_output[1])
 );
SRLC16E U_SRLC16E_THREE ( .D(inBits[2]),
.A0(1),
.A1(1),
.A2(control[0]),
.A3(control[1]),
.CLK(clk),
.CE(1),
.Q(SRL_output[2]),
.Q15(Q15_output[2])
 );

SRLC16E U_SRLC16E_FOUR ( .D(inBits[3]),
.A0(1),
.A1(1),
.A2(control[0]),
.A3(control[1]),
.CLK(clk),
.CE(1),
.Q(SRL_output[3]),
.Q15(Q15_output[3])
 );
 
 SRLC16E U_SRLC16E_FIVE( .D(inBits[4]),
.A0(1),
.A1(1),
.A2(control[0]),
.A3(control[1]),
.CLK(clk),
.CE(1),
.Q(SRL_output[4]),
.Q15(Q15_output[4])
 );
 
 SRLC16E U_SRLC16E_SIX ( .D(inBits[5]),
.A0(1),
.A1(1),
.A2(control[0]),
.A3(control[1]),
.CLK(clk),
.CE(1),
.Q(SRL_output[5]),
.Q15(Q15_output[5])
 );
 
 SRLC16E U_SRLC16E_SEVEN ( .D(inBits[6]),
.A0(1),
.A1(1),
.A2(control[0]),
.A3(control[1]),
.CLK(clk),
.CE(1),
.Q(SRL_output[6]),
.Q15(Q15_output[6])
 );
 
 SRLC16E U_SRLC16E_EIGHT ( .D(inBits[7]),
.A0(1),
.A1(1),
.A2(control[0]),
.A3(control[1]),
.CLK(clk),
.CE(1),
.Q(SRL_output[7]),
.Q15(Q15_output[7])
 );
//SRL16E #(
//   .INIT(16'h0000) // Initial Value of Shift Register
//) SRL16E_ONE (
//   .Q(SRL_output[0] ),       // SRL data output
//   .A0(1),     // Select[0] input
//   .A1(1),     // Select[1] input
//   .A2(control[0] ),     // Select[2] input
//   .A3(control[1]),     // Select[3] input
//   .CE(1),     // Clock enable input
//   .CLK(clk),   // Clock input
//   .D(inBits[0] )        // SRL data input
//);

//SRL16E #(
//   .INIT(16'h0000) // Initial Value of Shift Register
//) SRL16E_TWO (
//   .Q(SRL_output[1] ),       // SRL data output
//   .A0(1),     // Select[0] input
//   .A1(1),     // Select[1] input
//   .A2(control[0] ),     // Select[2] input
//   .A3(control[1]),     // Select[3] input
//   .CE(1),     // Clock enable input
//   .CLK(clk),   // Clock input
//   .D(inBits[1] )        // SRL data input
//);


//SRL16E #(
//   .INIT(16'h0000) // Initial Value of Shift Register
//) SRL16E_THREE (
//   .Q(SRL_output[2]),       // SRL data output
//   .A0(1),     // Select[0] input
//   .A1(1),     // Select[1] input
//   .A2(control[0] ),     // Select[2] input
//   .A3(control[1]),     // Select[3] input
//   .CE(1),     // Clock enable input
//   .CLK(clk),   // Clock input
//   .D(inBits[2])        // SRL data input
//);


//SRL16E #(
//   .INIT(16'h0000) // Initial Value of Shift Register
//) SRL16E_FOUR (
//   .Q(SRL_output[3] ),       // SRL data output
//   .A0(1),     // Select[0] input
//   .A1(1),     // Select[1] input
//   .A2(control[0] ),     // Select[2] input
//   .A3(control[1]),     // Select[3] input
//   .CE(1),     // Clock enable input
//   .CLK(clk),   // Clock input
//   .D(inBits[3])        // SRL data input
//);


//SRL16E #(
//   .INIT(16'h0000) // Initial Value of Shift Register
//) SRL16E_FIVE (
//   .Q(SRL_output[4] ),       // SRL data output
//   .A0(1),     // Select[0] input
//   .A1(1),     // Select[1] input
//   .A2(control[0] ),     // Select[2] input
//   .A3(control[1]),     // Select[3] input
//   .CE(1),     // Clock enable input
//   .CLK(clk),   // Clock input
//   .D(inBits[4])        // SRL data input
//);


//SRL16E #(
//   .INIT(16'h0000) // Initial Value of Shift Register
//) SRL16E_SIX (
//   .Q(SRL_output[5] ),       // SRL data output
//   .A0(1),     // Select[0] input
//   .A1(1),     // Select[1] input
//   .A2(control[0] ),     // Select[2] input
//   .A3(control[1]),     // Select[3] input
//   .CE(1),     // Clock enable input
//   .CLK(clk),   // Clock input
//   .D(inBits[5])        // SRL data input
//);


//SRL16E #(
//   .INIT(16'h0000) // Initial Value of Shift Register
//) SRL16E_SEVEN (
//   .Q(SRL_output[6] ),       // SRL data output
//   .A0(1),     // Select[0] input
//   .A1(1),     // Select[1] input
//   .A2(control[0] ),     // Select[2] input
//   .A3(control[1]),     // Select[3] input
//   .CE(1),     // Clock enable input
//   .CLK(clk),   // Clock input
//   .D(inBits[6])        // SRL data input
//);


//SRL16E #(
//   .INIT(16'h0000) // Initial Value of Shift Register
//) SRL16E_EIGHT (
//   .Q(SRL_output[7] ),       // SRL data output
//   .A0(1),     // Select[0] input
//   .A1(1),     // Select[1] input
//   .A2(control[0] ),     // Select[2] input
//   .A3(control[1]),     // Select[3] input
//   .CE(1),     // Clock enable input
//   .CLK(clk),   // Clock input
//   .D(inBits[7])        // SRL data input
//);
/////////////////////////////////////////////////////////////////////////////
 //second register SRL16
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
   .D(Q15_output[0])        // SRL data input
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
   .D(Q15_output[1])        // SRL data input
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
   .D(Q15_output[2])        // SRL data input
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
   .D(Q15_output[3])        // SRL data input
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
   .D(Q15_output[4])        // SRL data input
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
   .D(Q15_output[5])        // SRL data input
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
   .D(Q15_output[6])        // SRL data input
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
   .D(Q15_output[7])        // SRL data input
);





mux2_1 mux0(.in1(SRL_output2[0]),.in2(SRL_output[0]),.select(control[2]) ,.out(mux1_output[0]));
mux2_1 mux1(.in1(SRL_output2[1]),.in2(SRL_output[1]),.select(control[2]) ,.out(mux1_output[1]));
mux2_1 mux2(.in1(SRL_output2[2]),.in2(SRL_output[2]),.select(control[2]) ,.out(mux1_output[2]));
mux2_1 mux3(.in1(SRL_output2[3]),.in2(SRL_output[3]),.select(control[2]) ,.out(mux1_output[3]));
mux2_1 mux4(.in1(SRL_output2[4]),.in2(SRL_output[4]),.select(control[2]) ,.out(mux1_output[4]));
mux2_1 mux5(.in1(SRL_output2[5]),.in2(SRL_output[5]),.select(control[2]) ,.out(mux1_output[5]));
mux2_1 mux6(.in1(SRL_output2[6]),.in2(SRL_output[6]),.select(control[2]) ,.out(mux1_output[6]));
mux2_1 mux7(.in1(SRL_output2[7]),.in2(SRL_output[7]),.select(control[2]) ,.out(mux1_output[7]));

mux2_1 mux_2_0(.in1(mux1_output[0]),.in2(inBits[0]),.select(control[3]), .out(outBits[0])); 
mux2_1 mux_2_1(.in1(mux1_output[1]),.in2(inBits[1]),.select(control[3]), .out(outBits[1])); 
mux2_1 mux_2_2(.in1(mux1_output[2]),.in2(inBits[2]),.select(control[3]), .out(outBits[2])); 
mux2_1 mux_2_3(.in1(mux1_output[3]),.in2(inBits[3]),.select(control[3]), .out(outBits[3])); 
mux2_1 mux_2_4(.in1(mux1_output[4]),.in2(inBits[4]),.select(control[3]), .out(outBits[4])); 
mux2_1 mux_2_5(.in1(mux1_output[5]),.in2(inBits[5]),.select(control[3]), .out(outBits[5])); 
mux2_1 mux_2_6(.in1(mux1_output[6]),.in2(inBits[6]),.select(control[3]), .out(outBits[6])); 
mux2_1 mux_2_7(.in1(mux1_output[7]),.in2(inBits[7]),.select(control[3]), .out(outBits[7])); 

endmodule 
