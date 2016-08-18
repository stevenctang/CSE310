`include module1.v

module tb_my_module;
	reg x_tb;
	reg y_tb;
	wire z_tb;
//Instance of my_module
	my_module unit1(x_tb, y_tb, z_tb); //verilog 1995
//Can also right the above line like:
	my_module uut2(.y(a),.x(b),.z(c));
endmodule;


