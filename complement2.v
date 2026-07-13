module complement2(
    input [3:0]i,
    output [3:0] k,
    output [3:0] y
  );
  assign k = ~i;
  assign y = k+1;
endmodule

module complement2_tb;
  reg [3:0]i;
  wire [3:0] k;
  wire [3:0] y;

  complement2 dut ( .i(i), .k(k), .y(y) );
  initial begin
    $monitor( "i=%b k=%b y=%b", i, k, y );
    i= 4'b1101;
#10 i= 4'b1011;
#10 $finish;

end
endmodule
