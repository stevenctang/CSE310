module fpga (input wire W, X, Y, Z, output wire a, b, c, d, e, f, g);
  assign a = !W&Y || X&Y || W&!Z || !X&!Z || !W&X&Z || W&!X&!Y;
  assign b = !X&!Y || !X&!Z || !W&!Y&!Z || !W&Y&Z || W&!Y&Z;
  assign c = !W&X || W&!X || !Y&Z || !W&!Y || !W&Z; 
  assign d = X&!Y&Z || !X&Y&Z || X&Y&!Z || W&!Y&!Z || !W&!X&!Z;
  assign e = W&X || Y&!Z || W&Y || W&!Z || !X&!Z;
  assign f = !W&X || W&!X || !Y&!Z || X&Y;
  assign g = W&!X || Y&!Z || W&Z || !X&Y || !W&X&!Y;
endmodule

module test();
  reg W,X,Y,Z;
  output wire a,b,c,d,e,f,g;

  // set up the monitoring
initial 
  begin
    $display("W  X  Y  Z  | a  b  c  d  e  f  g  Time");
    $monitor("%b  %b  %b  %b  | %b  %b  %b  %b  %b  %b  %b  %d",W,X,Y,Z,a,b,c,d,e,f,g,$time);
end
  
  // run through a series of numbers
initial 
  begin
    	W = 1'b0; X = 1'b0;  Y = 1'b0;  Z = 1'b0;

  #150 $finish;
end
  always #10 W = !W;
  always #20 X = !X;
  always #40 Y = !Y;
  always #80 Z = !Z;

  // create instance of adder
fpga run(W,X,Y,Z,a,b,c,d,e,f,g); //instance line 
endmodule

