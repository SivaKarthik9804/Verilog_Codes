module encoder42(
    input [3:0]i,
    output [1:0]y );

  assign y[0]= i[2] | i[3];
  assign y[1]= i[1] | i[3];

endmodule

module encoder42_tb;
  reg [3:0]i;
  wire [1:0]y;

  encoder42 dut ( .i(i), .y(y) );
  initial begin
   $monitor("$Time=0%t i=%t y=%t", $time, i, t);
   i[0]=4'b0001;
#10 i[1]=4'b0010;
#10 i[2]=4'b0100;
#10 i[3]=4'b1000;
#10 $finish;
  end
endmodule
