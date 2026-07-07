/*module fullsubtractor_beh(
    input a, b, bin,
    output reg difference, borrow
  );

  always @ (*) begin
     if(a==1'b0 && b==1'b0 && bin==1'b0) begin difference=1'b0; borrow=1'b0; end
else if(a==1'b0 && b==1'b0 && bin==1'b1) begin difference=1'b1; borrow=1'b1; end
else if(a==1'b0 && b==1'b1 && bin==1'b0) begin difference=1'b1; borrow=1'b1; end
else if(a==1'b0 && b==1'b1 && bin==1'b1) begin difference=1'b0; borrow=1'b1; end
else if(a==1'b1 && b==1'b0 && bin==1'b0) begin difference=1'b1; borrow=1'b0; end
else if(a==1'b1 && b==1'b0 && bin==1'b1) begin difference=1'b0; borrow=1'b0; end
else if(a==1'b1 && b==1'b1 && bin==1'b0) begin difference=1'b0; borrow=1'b0; end
else begin difference=1'b1; borrow=1'b1; end

end
endmodule

module fullsubtractor_beh_tb;
  reg a, b, bin;
  wire difference, borrow;

  fullsubtractor_beh dut ( .a(a), .b(b), .bin(bin), .difference(difference), .borrow(borrow) );
  initial begin
    $monitor( "$Time=0%t a=%t b=%t bin=%t difference=%t borrow=%t", $time, a, b, bin, difference, borrow );
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
endmodule */

module fullsubtractor_case(
    input a, b, bin,
    output reg difference, borrow
  );

  always @ (*) begin
    case({a, b, bin})
      3'b000 : begin difference = 1'b0; borrow=1'b0; end
      3'b001 : begin difference = 1'b1; borrow=1'b1; end
      3'b010 : begin difference = 1'b1; borrow=1'b1; end
      3'b011 : begin difference = 1'b0; borrow=1'b0; end
      3'b100 : begin difference = 1'b1; borrow=1'b0; end
      3'b101 : begin difference = 1'b0; borrow=1'b0; end
      3'b110 : begin difference = 1'b0; borrow=1'b0; end
      3'b111 : begin difference = 1'b0; borrow=1'b0; end
      default : begin difference= 1'b0; borrow= 1'b0; end
    endcase
  end
endmodule


module fullsubtractor_case_tb;
  reg a, b, bin;
  wire difference, borrow;

  fullsubtractor_case dut ( .a(a), .b(b), .bin(bin), .difference(difference), .borrow(borrow) );
  initial begin
    $monitor( "$Time=0%t a=%t b=%t bin=%t difference=%t borrow=%t", $time, a, b, bin, difference, borrow );
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
