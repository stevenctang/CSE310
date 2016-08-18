/*
 * This program was an example in class that had to do with an adder
 * Example: 
 * A | B | Y
 * 0 | 0 | 0
 * 0 | 1 | 1
 * 1 | 2 | 3
 * 3 | 3 | 6
*/
module Accumulator(input clk,reset, output [3:0] y);
	
	wire [3:0] w1,w2;
	
//Create 3 instances, 1 for adder, counter and register
	adder adder_inst(.A(y), .B(w2), .Y(w1));
	counter counter_inst(.reset(reset),.clk(clk),.count(w2));
	register4 reg_inst(.din(w1), .dout(y), .reset(reset), .clk(clk));

endmodule
