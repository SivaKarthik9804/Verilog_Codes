module mux41(
input i0, i1, i2, i3,
input [1:0]s,
output y );

assign y=( ~s[1] & ~s[0] & i0 | ~s[1] & s[0] & i1 | s[1] & ~s[0] & i2 | s[1] & s[0] & i3 );
endmodule 

module mux16_hire(
    input [15:0]i,
    input [3:0]s,
    output y
  );
  wire y0, y1, y2, y3;

  mux41 ma( i[0], i[1], i[2], i[3], s[1:0], y0);
  mux41 mb( i[4], i[5], i[6], i[7], s[1:0], y1);
  mux41 mc( i[8], i[9], i[10], i[11], s[1:0], y2);
  mux41 md( i[12], i[13], i[14], i[15], s[1:0], y3);
  mux41 me( y0, y1, y2, y3, s[3:2], y);
endmodule

module mux16_hire_tb;
  reg [15:0]i;
  reg [3:0]s;
  wire y;
  integer x;

  mux16_hire dut ( .i(i), .s(s), .y(y) );
  initial begin 
    i=1'b1010010100110101;
    for (x=0; x<16; x=x+1)
    begin
      #10 x=s;
      #10 $finish;
    end
    end
endmodule


