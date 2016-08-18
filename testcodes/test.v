//D flip-flop with asynchronous reset 
module DFF (output reg Q, input D, Clk, Rst);
  always @(posedge Clk, posedge Rst )
  if  ( Rst ) Q <= 1'b0;
  else Q <= D;
endmodule

module count4 ( output [3:0]  Q, input Clk, input  Rst );
   wire a, b, c, d;
   not #(2) G1 ( a, Q[2] );
   buf #(2) G2 ( b, Q[0] );
   not #(2) G3 ( c, Q[3] );
   not #(2) G4 ( d, Q[1] );

   DFF FF0( .Q(Q[0]), .D(a), .Clk(Clk), .Rst(Rst) );
   DFF FF1( .Q(Q[1]), .D(b), .Clk(Clk), .Rst(Rst) );
   DFF FF2( .Q(Q[2]), .D(c), .Clk(Clk), .Rst(Rst) );
   DFF FF3( .Q(Q[3]), .D(d), .Clk(Clk), .Rst(Rst) );

endmodule

module tb1();
  // Inputs
  reg clk, rst;

  // Outputs
  wire [3:0] q;
  initial begin
    $display ("time\t	  Q[3]  Q[2]  Q[1]  Q[0]  Clk  Rst");
    $monitor ("%g \t %b %b %b %b %b %b",$time,Q[3],Q[2],Q[1],Q[0],Clk,Rst); 
  end
  initial
    begin
      clk = 1'b0;
      rst = 1'b1;
      #5 rst = 1'b0;
    end
  count4 testing([3:0]Q,Clk,Rst);

endmodule
