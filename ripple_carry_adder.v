/*module fulladder(
    input a, b, cin,
    output sum, carry
  );

  assign sum = a ^ b ^ cin;
  assign carry = a&b | b&cin | cin&a;
 //assign carry = ( (a^b) & cin | (a&b) );
endmodule

module ripple_carry_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
  );

  wire c1, c2, c3;
  fulladder fa1 (a[0], b[0], cin, sum[0], c1);
  fulladder fa2 (a[1], b[1], c1, sum[1], c2);
  fulladder fa3 (a[2], b[2], c2, sum[2], c3);
  fulladder fa4 (a[3], b[3], c3, sum[3], cout);
endmodule

module ripple_carry_adder_tb;
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    ripple_carry_adder dut ( .a(a), .b(b), .cin(cin), .sum(sum), .cout(cout) );
    initial begin 
    a=4'b0000; b=4'b0000; cin=1'b0;
#10 a=4'b0110; b=4'b1100; cin=1'b0;
#10 a=4'b0110; b=4'b0101; cin=1'b0;
#10 a=4'b1001; b=4'b1110; cin=1'b0;
#10 a=4'b1110; b=4'b0111; cin=1'b0;
#10 a=4'b0111; b=4'b1111; cin=1'b0;
#10 $finish;
end
endmodule */


module fulladd4(sum,cout,a,b,cin);
  output [3:0] sum;
  output cout;
  input [3:0] a,b;
  input cin;
  
  wire c1,c2,c3;
  
  fulladd1 FA0(sum[0],c1,a[0],b[0],cin);
  fulladd1 FA1(sum[1],c2,a[1],b[1],c1);
  fulladd1 FA2(sum[2],c3,a[2],b[2],c2);
  fulladd1 FA3(sum[3],cout,a[3],b[3],c3);

endmodule


module fulladd1(sum,cout,a,b,cin);
  output sum,cout;
  input a,b,cin;
  
  wire y0,y1,y2;
  
  xor (y0,a,b);
  xor (sum,y0,cin);
  
  and (y2,a,b);
  and (y1,y0,cin);
  
  or (cout,y1,y2);

endmodule


module tb_fulladd4;

reg [3:0] a,b;
reg cin;

wire [3:0] sum;
wire cout;

fulladd4 DUT(sum,cout,a,b,cin);

initial
begin
  $monitor("a=%b b=%b cin=%b sum=%b cout=%b",a,b,cin,sum,cout);

  a=4'b0000; b=4'b0000; cin=0; #10;
  a=4'b0011; b=4'b0101; cin=0; #10;
  a=4'b0110; b=4'b0011; cin=1; #10;
  a=4'b1111; b=4'b0001; cin=0; #10;
  a=4'b1111; b=4'b1111; cin=0; #10;
  a=4'b1010; b=4'b0101; cin=1; #10;
  a=4'b1001; b=4'b0110; cin=0; #10;

  $finish;
end

endmodule




  

