`timescale 1ns / 100ps

module Moore_FSM_tb(); 
// inputs & outputs 
reg clk, rst_n; 
reg x; 


// wire outputs
wire out; 

parameter s0 = 2'b00; 
parameter s1 = 2'b01; 
parameter s2 = 2'b10; 
parameter s3 = 2'b11; 

// instantiate dut
Moore_FSM dut(.clk(clk), .rst_n(rst_n), .x(x), .out(out)); 

// generate clk
always begin 
clk = 1'b1; #5 clk = 1'b0; #5; 
end 


// store inputs in testvectors and put reset values.  
initial begin 
rst_n = 1'b0; 
@(negedge clk); rst_n = 1'b1;
@(posedge clk); #1 x = 0; 
@(posedge clk); #1 x = 1;
@(posedge clk); #1 x = 1; //011 pattern 
@(posedge clk); #1 x = 1;
@(posedge clk); #1 x = 1;
@(posedge clk); #1 x = 0;
@(posedge clk); #1 x = 1;
@(posedge clk); #1 x = 0;
@(posedge clk); #1 x = 0;
@(posedge clk); #1 x = 0;
@(posedge clk); #1 x = 1; 
@(posedge clk); #1 x = 1; //011 pattern

end


endmodule 