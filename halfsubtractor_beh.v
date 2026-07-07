/* module halfsubtractor_beh(
  input a, b,
  output reg difference, borrow
);

always @ (*) begin
  if (a==1'b0 && b==1'b0)     begin difference=1'b0; borrow=1'b0; end
else  if (a==1'b0 && b==1'b0) begin difference=1'b1; borrow=1'b1; end
else  if (a==1'b0 && b==1'b0) begin difference=1'b1; borrow=1'b0; end
else begin difference=1'b0; borrow=1'b0; end

end
endmodule

module halfsubtractor_beh_tb;
  reg a, b;
  wire difference, borrow;

  halfsubtractor_beh dut ( .a(a), .b(b), .difference(difference), .borrow(borrow) );

  initial begin
  $monitor ("Time=0%t a=%b b=%b difference=%b borrow=%b", $time, a, b, difference, borrow );
    a=1'b0; b=1'b0;
#10 a=1'b0; b=1'b1;
#10 a=1'b1; b=1'b0;
#10 a=1'b1; b=1'b1;
#10 $finish;
end
endmodule  */


module  halfsubtractor_case(
    input a, b,
    output reg difference, borrow
  );

  always @ (*) begin
    case({a, b})
      2'b00 : begin difference=1'b0; borrow=1'b0; end
      2'b01 : begin difference=1'b1; borrow=1'b1; end
      2'b10 : begin difference=1'b1; borrow=1'b0; end
      2'b11 : begin difference=1'b0; borrow=1'b0; end
      default : begin difference=1'b0; borrow=1'b0; end
    endcase
  end
endmodule

module halfsubtractor_case_tb;
  reg a, b;
   wire difference, borrow;

  halfsubtractor_case dut ( .a(a), .b(b), .difference(difference), .borrow(borrow) );

  initial begin
  $monitor ("Time=0%t a=%b b=%b difference=%b borrow=%b", $time, a, b, difference, borrow );
    a=1'b0; b=1'b0;
#10 a=1'b0; b=1'b1;
#10 a=1'b1; b=1'b0;
#10 a=1'b1; b=1'b1;
#10 $finish;
end
endmodule  
