module comparator_1b(
    input a, b,
    output [2:0]y
  );

  assign y[0] = a < b;
  assign y[1] = a == b;
  assign y[2] = a > b;

endmodule

module comparator_1b_tb;
  reg a, b;
  wire [2:0]y;

  comparator_1b dut ( .a(a), .b(b), .y(y) );
  initial begin
    $monitor ( "a=%b b=%b y=%b", a, b, y);
    a = 1'b1; b= 1'b0;
#10 a = 1'b0; b= 1'b0;
#10 a = 1'b1; b= 1'b1;
#10 a = 1'b0; b= 1'b1;
#10 $finish;
end
endmodule

