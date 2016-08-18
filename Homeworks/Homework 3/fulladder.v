module fullAdder(a,b,c,carry,sum);

initial begin
	input a, b, c;
	
	output carry, sum;

	PARTS:
	HalfAdder(a=a,b=b,sum=sum1,carry=carry1);
	HolfAdder(a=c,b=sum1,sum=sum,carry=carry2);
	Or(a=carry1,b=carry2,out=carry);
	
end

endmodule 
