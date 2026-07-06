module half_subtractor(
    input a, b,
    output difference, borrow
  );

  assign difference = a ^ b;
  assign borrow = ~a & b;

endmodule


module half_subtractor_tb;
  reg a, b;
  wire difference, borrow;

  half_subtractor dut ( .a(a), .b(b), .difference(difference), .borrow(borrow) );

  initial begin 
    $monitor ("$Time=0%b a=%b b=%b difference=%b borrow=%b", $time, a, b, difference, borrow);

    a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1;
#10 $finish;

end
endmodule

