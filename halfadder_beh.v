// Using Case Statements

module halfadder_beh(
    input a, b,
    output reg sum,
    output reg carry
  );

  always@(*)begin
    case({a, b})
      2'b00 : begin sum=0; carry=0; end
      2'b01 : begin sum=1; carry=0; end
      2'b10 : begin sum=1; carry=0; end
      2'b11 : begin sum=1; carry=1; end
      default : begin sum = 0; carry = 0; end 
      endcase
  end
endmodule

module halfadder_beh_tb;
  reg a, b;
  wire sum;
  wire carry;

  halfadder_beh dut ( .a(a), .b(b), .sum(sum), .carry(carry) );
  initial begin 
    $monitor("$Time=0%t a=%b b=%b sum=%b carry=%b", $time, a, b, sum, carry);
    a=1'b0; b=1'b0;
#10 a=1'b0; b=1'b1;
#10 a=1'b1; b=1'b0;
#10 a=1'b1; b=1'b1;
#10 $finish;

end
endmodule 

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// Using if-elseif Statements

module halfadder_case(
     input a, b,
    output reg sum,
    output reg carry
  );
  always @ (*) begin 
     if (a==1'b0 && b==1'b0) begin sum=1'b0; carry=1'b0; end
else if (a==1'b0 && b==1'b1) begin sum=1'b1; carry=1'b0; end
else if (a==1'b1 && b==1'b0) begin sum=1'b1; carry=1'b0; end
else begin sum=1'b1; carry=1'b1; end
end
endmodule

module halfadder_case_tb;
  reg a, b;
  wire sum;
  wire carry;

  halfadder_case dut ( .a(a), .b(b), .sum(sum), .carry(carry) );
  initial begin 
    $monitor("$Time=0%t a=%b b=%b sum=%b carry=%b", $time, a, b, sum, carry);
    a=1'b0; b=1'b0;
#10 a=1'b0; b=1'b1;
#10 a=1'b1; b=1'b0;
#10 a=1'b1; b=1'b1;
#10 $finish;

end
endmodule 




