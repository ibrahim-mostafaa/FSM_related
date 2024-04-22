
module Moore_FSM(
input clk,
input rst_n,
input x,
output reg out
); 

// states: 

parameter s0 = 2'b00; 
parameter s1 = 2'b01; 
parameter s2 = 2'b10; 
parameter s3 = 2'b11; 

reg [1:0] state, next_state;

// state register 
always@(posedge clk or negedge rst_n) begin 
if (!rst_n) state <= s0;
else state <= next_state; 
end 

// next state logic 
always@(*) begin 
case(state)
s0: if(!x) next_state = s1; 
	else next_state = s0; 
s1: if(!x) next_state = s1; 
	else next_state = s2; 
s2: if(!x) next_state = s1; 
	else next_state = s3; 
s3: if(!x) next_state = s1; 
	else next_state = s0; 
	
default: next_state = s0; 
endcase 
end
 
// output logic 
always@(*) begin 
case(state)
s0: out <= 1'b0; 
s1: out <= 1'b0;
s2: out <= 1'b0;
s3: out <= 1'b1;
default: out <= 1'bz;
endcase
end 
endmodule 