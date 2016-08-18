module two_to_four_dec;
    input a,
	  b,
  	  en;
    output
	  [3:0] F;
    wire en1 = ~en;
    assign F[0] = ~(~A & ~B & en1);
    assign F[1] = ~(A & ~B & en1);
    assign F[2] = ~(~A & B & en1);
    assign F[3] = ~(A & B & en1);
endmodule

module two_to_four_dec_TB;
    reg a,b,en;
    wire [3:0] F;
two_to_four_dec testing (a,b,en,out);

    initial begin
        $display("Enable a b | F[0] F[1] F[] F[3]");
        $monitor("%b   %b   %b  | %b  %b  %b  %b",en,a,b,F[0],F[1],F[2],F[3]);
en = 0;
a = 0;     
b = 0;

#9 $finish;
end

always #5  a = ~a;

always #10  b = ~b;

always #20  en = ~en;

endmodule
