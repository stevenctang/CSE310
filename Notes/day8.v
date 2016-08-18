// D Flip Flop
module d_ff(input wire D, input wire clk, output reg Q);
	always @(posedge clk)
		Q <= D
endmodule

//For any flip flop, we always have an input clock
//T flip flop 
// T Stands for Toggle
//Note that our D is always for Reg
module (input wire T, input wire clk, output reg D);
	always @(posedge clk)
	Q <= T^Q;
// The ^ is the verilog equivalent for XOR
endmodule

//D flip flop TB
module D_FF_tb;
	reg tb_D;
	reg tb_clk;
	wire tb_Q;

	//port connection
	d_ff out1(.D(tb_D), clk(tb_clk), Q(tb_Q) 
	// In the above line, it's called port connection, D is being connected or in relations to tb_D that's in our test bench, and clk is in relations to tb_clk etc.

initial begin
	clk = 0;
	repeat(8)
	//Repeat 8 cycles 4 times. clk can be 0/1 so 0 to 1 is one cycle. and we want to do that 4 times it would be 4*2 = 8

	#5 clk = !clk;
/*
	Another way to initialize clock 4 times:
	initial begin
	always @
	#5 clk = ~clk;
	. . .
*/
end

// 4 bit register = 4 Flip Flops 
// Below we want 4 bit registers
module rege(input wire [3:0] D, input wire clk; output reg[3:0] Q);
	//Create instances of the D Flip flop
	D_FF D0(.D(D[0], clk (clk), Q(Q[0]);
	D_FF D1(.D(D[1], clk (clk), Q(Q[1]);
	D_FF D2(.D(D[2], clk (clk), Q(Q[2]);
	D_FF D3(.D(D[3], clk (clk), Q(Q[3]);
endmodule

//Now we want 8 bit register below
// 8 bit register = 8 flip flops or 2 4 bit registers
module reg8(input wire [7:0] D, input wire clk; output [7:0] Q);
	// notice how we left out [7:0] Q empty , not specifying if it's a wire or reg, by default blank is wire
	//Create instances of the 4 bit register, better than doing the flip flops
	reg4 t1(.D(D[3:0]),clk(clk),Q(Q[3:0]);
	reg4 t2(.D(D[7:4]),clk(clk),Q(Q[7:4]);

endmodule

//Reset added to the flip flops
/*
___|---|____|---|___ 
Reset only happens when clock = 0;
*/
module D_FF(input D, clk, reset, output reg Q);
	always @(posedge clk)
		if(reset == 1)
			Q <= 0;
		else
			Q<=D;
endmodule

//Non sychronized Clock
Only difference from the above code is:
always @(posedge clk, posedge reset)
begin
	if(reset) // same as reset == 1
		Q <= 0;
	else 
		Q <= D;

end

//Swap
module swap(input [7:0] d1,d2,input clk, output reg[7:0] Q1,Q2);
	always @(posedge clk)
	begin
		Q1 = Q2;
		Q2 = Q1;
		Q2 = temp;
	end
	// This is blocking assignments
	/*
	Another way:
	always @(posedge clk)
	begin 
		Q1 <= Q2;
		Q2 <= Q1;
	end
	*/

//This is nonsynchornous 
//bcd counter verilog program
module BCD_counter(input clk, reset, output reg[3:0] count);
	
	always @ (posedge clk, posedge reset)
		count <= count + 1; //next count = current count
	begin
	if(reset)
		count < 0;
	else if(count < 9)
		count <= count +1;
	else
		count = 0;
	end 
endmodule


