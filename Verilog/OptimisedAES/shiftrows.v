module shiftrows(inbyte, clock, outbyte, ready);

// declare our FSM states
parameter IDLE = 0, ONE = 1, TWO =2, THREE =3, FOUR = 4;

//declare inputs and output
input clock;
input [7:0] inbyte;
output [7:0] outbyte;
output ready = 0;

//declare the control signals that will serve as input to multiplexers and multiplexers output
reg [3:0] control;
wire mux_output1, mux_output2, mux_output3;

//declare the 12 registers (each is 1 byte long)
reg [7:0] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11;

//counter that will be used to cycle through FSM
integer counter = 0;

//FSM States
reg [2:0] currentState =IDLE; 
reg [2:0] nextState;

//Control signals for Mux
reg [4:0] control = 5'b00000;


always @ (posedge clk)begin
counter <= counter +1;
currentState <= nextState; 
d0 <= mux_output1;
d1 <= d0;
d2 <= d1;
d3 <= d2;
d4 <= mux_output2;
d5 <= d4;
d6 <= d5;
d7 <= d6;
d8 <= mux_output3;
d9 <= d8;
d10 <= d9;
d11 <= d10;


always@(*) begin
case (currentState)
    IDLE: begin
        if (counter == 11) begin
            nextState <=ONE;
        end
    ready <= 0;
    end
    
    ONE: begin
    control <= 5'b00011;
    ready <=1;
    if ((counter == 12) or (counter == 16) or (counter == 20) or (counter == 22)) begin
    nextState <= TWO;
    end else if (counter == 27) begin
        nextState <= ONE;
        counter <=12;
    end else begin
    nextState <= ONE;
    end
    end
    
    TWO: begin
    control <= 5'b00110;
    ready <=1;
    if ((counter == 21) or (counter == 23)) begin
    nextState <= ONE;
    end else begin
    nextState <= THREE;
    end
    end
    
    THREE: begin
    control <= 5'b01001;
    ready <=1;
    if (counter == 18) begin
    nextState <= THREE;
    end else begin
    nextState <= FOUR;
    end
    end
    
    FOUR: begin
    control <= 5'b10000;
    ready <=1;
    nextState <= ONE;
    end
endcase
end

mux inst1 (.s1(control[4]), .in1(inbyte), in2(d11), .out(mux_output1));
mux inst2 (.s1(control[3]), .in(d3), in2(d11), .out(mux_output1));
mux inst3 (.s1(control[2]), .in(d7), in2(d11), .out(mux_output1));

mux2 instance1 (.s1(control [1]), .s2(control [0]), .in1(inbyte), .in2(d3), .in3(d7), .in4(d11) );

endmodule 
