/*module full_subtractor(
    input a, b, bin,
    output difference, bout
  );

  assign difference = a ^ b ^ bin;
  assign bout = (~a & b) | (~a & bin) | (b & bin); 

endmodule

module ripple_carry_subtractor(
    input [3:0]a,
    input [3:0]b,
    input bin,
    output [3:0]difference,
    output bout
  );
wire b1, b2, b3;

  full_subtractor fs1 ( a[0], b[0], bin, difference[0], b1 );
  full_subtractor fs2 ( a[1], b[1], b1, difference[1], b2 );
  full_subtractor fs3 ( a[2], b[2], b2, difference[2], b3 );
  full_subtractor fs4 ( a[3], b[3], b3, difference[3], bout );

endmodule

module ripple_carry_subtractor_tb;
  reg [3:0]a;
  reg [3:0]b;
  reg bin;
  wire [3:0] difference;
  wire bout;
  integer i, j;

  ripple_carry_subtractor dut ( .a(a), .b(b), .bin(bin), .difference(difference), .bout(bout) );
  initial begin
    $monitor ( "a=%b b=%b bin=%b difference=%b bout=%b", a, b, bin, difference, bout );

 bin = 1'b0;
     for(i = 0; i < 16; i = i + 1) begin
        for(j = 0; j < 16; j = j + 1) begin
            a = i;
            b = j;
            #10;
        end
    end

    $finish;
end
endmodule */

module full_adder(
    input a, b, cin,
    output sum, carry
);

assign sum = a ^ b ^ cin;
assign carry = (a & b) | (a & cin) | (b & cin);

endmodule


module ripple_carry_subtractor(
    input [3:0] a,
    input [3:0] b,
    output [3:0] difference,
    output borrow
);

wire [3:0] w;
wire c1, c2, c3;

assign w = ~b;

full_adder fa1(a[0], w[0], 1'b1, difference[0], c1);
full_adder fa2(a[1], w[1], c1,   difference[1], c2);
full_adder fa3(a[2], w[2], c2,   difference[2], c3);
full_adder fa4(a[3], w[3], c3,   difference[3], borrow);

endmodule

module ripple_carry_subtractor_tb;
reg [3:0] a, b;
wire [3:0] difference;
wire borrow;

integer i, j;

ripple_carry_subtractor dut( .a(a), .b(b), .difference(difference), .borrow(borrow) );

initial begin
    $monitor("a=%d b=%d difference=%d borrow=%b", a, b, difference, borrow);
    for(i=0; i<16; i=i+1) begin
        for(j=0; j<16; j=j+1) begin
            a = i;
            b = j;
            #10;
        end
    end
    $finish;
end
endmodule

