module demux18(
    input d,
    input [2:0]s,
    output [7:0]y );

assign y[0] = ~s[0] & ~s[1] & ~s[2] & d;
assign y[1] = ~s[0] & ~s[1] &  s[2] & d;
assign y[2] = ~s[0] &  s[1] & ~s[2] & d;
assign y[3] = ~s[0] &  s[1] &  s[2] & d;
assign y[4] =  s[0] & ~s[1] & ~s[2] & d;
assign y[5] =  s[0] & ~s[1] &  s[2] & d;
assign y[6] =  s[0] &  s[1] & ~s[2] & d;
assign y[7] =  s[0] &  s[1] &  s[2] & d;

endmodule


module demux18_tb;
  reg d;
  reg [2:0]s;
  wire [7:0]y;

  demux18 dut ( .d(d), .s(s), .y(y) );

  initial begin
    $monitor( "$Time=%0t d=%b s=%b y=%b", $time, d, s, y);
  #10  d=1; s[0]=0; s[1]=0; s[2]=0;
  #10  d=1; s[0]=0; s[1]=0; s[2]=1;
  #10  d=1; s[0]=0; s[1]=1; s[2]=0;
  #10  d=1; s[0]=0; s[1]=1; s[2]=1;
  #10  d=1; s[0]=1; s[1]=0; s[2]=0;
  #10  d=1; s[0]=1; s[1]=0; s[2]=1;
  #10  d=1; s[0]=1; s[1]=1; s[2]=0;
  #10  d=1; s[0]=1; s[1]=1; s[2]=1;
  #10 $finish;

end
endmodule




