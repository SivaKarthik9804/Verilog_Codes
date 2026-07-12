module demux256(
    input i,
    input [7:0]s,
    output [255:0]y
  );
  assign y = i << s;
endmodule

module demux256_tb;
  reg i;
  reg [7:0]s;
  wire [255:0]y;
   integer k;

demux256 dut( .i(i), .s(s), .y(y) );

initial begin
  $monitor("Time=%0t i=%b s=%0d y=%b", $time, i, s, y[s]);
    i = 1'b1;
    for(k=0; k<256; k=k+1) begin
        s = k;
        #10;
    end
    i = 1'b0;
    for(k=0; k<256; k=k+1) begin
        s = k;
        #10;
    end
    #10 $finish;
end
endmodule
