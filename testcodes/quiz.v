module qz4 (input wire a,b,c,d,e,f, output wire W,X,Y,Z);

	wire w1,w2,w3;
	assign w1 = (a) ? b: c;
	assign w2 = (w1) ? d : e;
	assign w3 = ~w2 ^ w1 ^ f;
	assign W = (w2) ? a : b;
	assign X = ( w3) ? c : d;
	assign Y = (w1) ? e : f;
	assign Z = w3 || w2 && a ^ b;
endmodule
module examp1_tb;
	reg a,b,c,d,e,f;
	wire W,X,Y,Z;

initial begin
	$display("time\t a b c d e f | X Y Z W");
	$monitor ("%g\t %b %b %b %b %b %b | %b %b %b %b", $time,a, b, c, d, e, f, X, Y, Z, W);
a = 0;
b = 0;
c = 0;
d = 0;
e = 0;
f = 0;
#600 $finish;
end
always begin
#5 f = ~f;
end
always begin
#25 e = ~e;
end
always begin
#50 d = ~d;
end
always begin
#100 c = ~c;
end
always begin
#200 b = ~b;
end
always begin
#300 a = ~a;
end
qz4 test(a,b,c,d,e,f,X,Y,Z,W);

endmodule
