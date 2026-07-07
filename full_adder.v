module full_adder(
input a, b, cin,
output sum, cout );

assign sum = a ^ b ^ cin;
assign cout = a&b | b&cin | cin&a;

endmodule

module full_adder_tb;
reg a, b, cin;
wire sum, cout;

full_adder dut(.a(a), 
		.b(b),
 		.cin(cin),
 		.sum(sum),
 		.cout(cout)
);

initial begin
$monitor ("Time=%0t a=%b b=%b c=%b sum=%b cout=%b", $time, a, b, cin, sum, cout);
a=0; b=0; cin=0;
#10 a=0; b=0; cin=1;
#10 a=0; b=1; cin=0;
#10 a=0; b=1; cin=1;
#10 a=1; b=0; cin=0;
#10 a=1; b=0; cin=1;
#10 a=1; b=1; cin=0;
#10 a=1; b=1; cin=1;
$finish;
end
endmodule

 
