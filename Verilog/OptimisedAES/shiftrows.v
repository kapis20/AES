module shiftrows(inbyte, clock, enable, outbyte, ready);

//need to add an enable signal. Use this to XOR with the register content so when its 0, they are 0 too.
// declare our FSM states
parameter IDLE = 0, ONE = 1, TWO =2, THREE =3, FOUR = 4;


//declare inputs and output
input clock;
input [7:0] inbyte;
input enable;
output reg [7:0] outbyte;
output reg ready = 0;

//declare the control signals that will serve as input to multiplexers and multiplexers output
reg [4:0] control = 5'b00011;

//declare the 12 registers (each is 1 byte long)
reg [7:0] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11;

wire [7:0] mux_output1, mux_output2, mux_output3;


//counter that will be used to cycle through FSM
reg [4:0] counter = 1'b0;

//FSM States
reg [2:0] currentState =IDLE; 
reg [2:0] nextState = IDLE;

wire [7:0] temp_out;

always @ (posedge clock)begin

//only increment counter when enable = 1
if (enable == 1)begin
    counter <= counter + 1'b1;
    end else begin
    counter <= counter;
    end
    
    currentState <= nextState; 
    outbyte <= temp_out;
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
end


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
    if ((counter == 12) || (counter == 16) || (counter == 20) || (counter == 22)) begin
    nextState <= TWO;
    end else if (counter == 28) begin
        nextState <= ONE;
        counter <=12;
    end else begin
    nextState <= ONE;
    end
    end
    
    TWO: begin
    control <= 5'b00110;
    ready <=1;
    if ((counter == 21) || (counter == 23)) begin
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
    end else if (counter == 19) begin
    nextState <= ONE;
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

mux inst1 (.s1(control[4]), .in1(d11), .in2(inbyte), .out(mux_output1));
mux inst2 (.s1(control[3]), .in1(d11), .in2(d3), .out(mux_output2));
mux inst3 (.s1(control[2]), .in1(d11), .in2(d7), .out(mux_output3));

mux2 instance1 (.s1(control[1]), .s2(control[0]), .in1(inbyte), .in2(d3), .in3(d7), .in4(d11), .out(temp_out));

endmodule
