module demux12(
input d, s,
output y0, y1 );

assign y0= d & ~s;
assign y1= d & s; 

endmodule


module demux12_tb;

reg d, s;
wire y0, y1;

demux12 dut ( .d(d), .s(s), .y0(y0), .y1(y1) );

initial begin
    $monitor("Time=%0t d=%b s=%b y0=%b y1=%b",
              $time, d, s, y0, y1);

   #10  d=0; s=0; #10;
   #10  d=0; s=1; #10;
   #10  d=1; s=0; #10;
   #10 d=1; s=1; #10;

   #10  $finish;
end

endmodule


     
