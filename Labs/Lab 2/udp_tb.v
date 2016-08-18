`include "udp.v"
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
