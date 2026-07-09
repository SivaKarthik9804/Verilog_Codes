module mux81(
input i0, i1, i2, i3, i4, i5, i6, i7,
input [2:0]s,
output y );

assign y= ( ~s[2] & ~s[1] & ~s[0] & i0 | 
 ~s[2] & ~s[1] &  s[0] & i1 |
 ~s[2] &  s[1] & ~s[0] & i2 | 
 ~s[2] &  s[1] &  s[0] & i3 |
  s[2] & ~s[1] & ~s[0] & i4 |
  s[2] & ~s[1] &  s[0] & i5 |
  s[2] &  s[1] & ~s[0] & i6 |
  s[2] &  s[1] &  s[0] & i7 );

endmodule

module mux81_tb;
reg i0, i1, i2, i3, i4, i5, i6, i7;
reg [2:0]s;
wire y;

mux81 dut ( .i0(i0), .i1(i1), .i2(i2), .i3(i3), .i4(i4), .i5(i5), .i6(i6), .i7(i7), .s(s), .y(y) );

initial begin 
$monitor ("$Time=%b i0=%b  i1=%b  i2=%b  i3=%b  i4=%b  i5=%b  i6=%b  i7=%b  s=%b  y=%b", $time, i0, i1, i2, i3, i4, i5, i6, i7, s, y);

i0=1; i1=0; i2=0; i3=1; i4=1; i5=1; i6=0; i7=1;
s=3'b000;
#10 s=3'b001;
#10 s=3'b010;
#10 s=3'b011;
#10 s=3'b100;
#10 s=3'b101;
#10 s=3'b110;
#10 s=3'b111;
#10 $finish;

end
endmodule
