`timescale 1 ns / 100 ps
// Gate flow modeling
module mux_2_1(input a,b,sel, output Y);

wire w1, w2, w3;
and g1(w1,a,sel);
and g2(w2,w3,b);
not g3(w3,sel);
or g4(y,w1,w3);

endmodule
/*
//dataflow modeling
module mux_2_1_df(input A,B,sel, output reg Y);

always @*
	Y =(sel && A)||(!sel && B);
endmodule

//behavorial modeling
module mux_2_1_bm(input A,B,sel, output wire Y);
*//*
if ( sel ) assign Y = A;
else assign Y = B;
 Another way to write the above statement
 assign Y = (sel)? A:B;
 Another way is:
*/
/*
 case(sel);
 case 1: assign Y = A;
 case 0: assign Y = B;
 endcase
endmodule

//instanciation 

//TB for module mux_2_1
*/
module mux_2_1_tb;

reg a, b, sel;
wire y;
//mux_2_1 testing(a,b,sel,y);
initial begin
	sel=1'b1; a=1'b0; b=1'b0;
	#50 $display(sel, a, b, y);
	sel=1'b1; a=1'b1; b=1'b0;
	#50 $display(sel,a,b,y);
	sel=1'b0; a=1'b0; b=1'b0;
	#50 $display(sel,a,b,y);
	sel=1'b0; a=1'b0; b= 1'b1;
	#50 $display(sel,a,b,y);
end
mux_2_1 S1(a,b,sel,y);
//mux_2_1 testing(a,b,sel,y);
endmodule

// Things we covered today
/*

	reg vs wire
	always statement
	bitwise operators vs logical operators
	comparison of three model methods:
		gate level
		data flow
		behavioral modelling
	Parameters ( example 2 to 1 mux )
	concurrency
	some new features in verilog 2001
*/
