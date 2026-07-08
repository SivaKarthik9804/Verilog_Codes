module halfsubtractor(
    input a,b,
    output difference, borrow
  );
  assign difference = a^b;
  assign borrow = ~a & b;
endmodule 

module fullsubtractor_hire(
    input a, b, bin,
    output difference, borrow 
  );
  wire d1, b1, b2;

  halfsubtractor hs1 (a, b, d1, b1);
  halfsubtractor hs2 (d1, bin, difference, b2);

  assign borrow = b1 | b2;
endmodule


module fullsubtractor_hire_tb;
    reg a, b, bin;
  wire difference, borrow;

  fullsubtractor_hire dut ( .a(a), .b(b), .bin(bin), .difference(difference), .borrow(borrow) );
  initial begin
    $monitor("a=%b b=%b bin=%b difference=%b borrow=%b", a, b, bin, difference, borrow);
    a=1'b0; b=1'b0; bin=1'b0;
#10 a=1'b0; b=1'b0; bin=1'b1;
#10 a=1'b0; b=1'b1; bin=1'b0;
#10 a=1'b0; b=1'b1; bin=1'b1;
#10 a=1'b1; b=1'b0; bin=1'b0;
#10 a=1'b1; b=1'b0; bin=1'b1;
#10 a=1'b1; b=1'b1; bin=1'b0;
#10 a=1'b1; b=1'b1; bin=1'b1;
#10 $finish;
end
endmodule



