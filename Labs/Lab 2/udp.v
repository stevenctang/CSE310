primitive UDP_02467 (D, A, B, C);
    output D;
    input A, B, C;
//Truth table for for D 5 F (A,B,C) 5 Summation(0,2,4,6,7);
    table
// A B C : D // Column Header Comment
   0 0 0 : 1;
   0 0 1 : 0;
   0 1 0 : 1;
   0 1 1 : 0;
   1 0 0 : 1;
   1 0 1 : 0;
   1 1 0 : 1;
   1 1 1 : 1;
    endtable
endprimitive

module udp_test();
    reg a, b, c;
    wire d;

    initial begin
        $display ("time\t a b c | d");
        $monitor ("%g\t %b %b %b | %b", $time, a,b,c, d);

        a = 0;
        b = 0;
        c = 0;
        #35 $finish;
    end

        always begin
        #5 c = ~c;
        end
        always begin
        #10 b = ~b;
        end
        always begin
        #20 c = ~c;
        end

UDP_02467 the_udp(d,a,b,c);
endmodule


module Circuit_with_UDP_02467 ( e, f, a, b, c, d);
    output e,f;
    input a, b, c, d;
    UDP_02467 (e, a, b, c);
    and (f, e, d);
endmodule
