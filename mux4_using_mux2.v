module mux2(
    input i0,
    input i1,
    input s,
    output y
);

assign y = (~s & i0) | (s & i1);

endmodule


module mux4(
    input [3:0] i,
    input [1:0] s,
    output y
);

wire y0, y1;

mux2 m0(i[0], i[1], s[0], y0);
mux2 m1(i[2], i[3], s[0], y1);
mux2 m2(y0, y1, s[1], y);

endmodule
module mux4_hire_tb;
reg  [3:0] i;
reg  [1:0] s;
wire y;

mux4 dut (
    .i(i),
    .s(s),
    .y(y)
);

initial begin
    $monitor("Time=%0t i=%b s=%b y=%b", $time, i, s, y);

    i = 4'b1010;

    s = 2'b00; #10;
    s = 2'b01; #10;
    s = 2'b10; #10;
    s = 2'b11; #10;

    i = 4'b1101;

    s = 2'b00; #10;
    s = 2'b01; #10;
    s = 2'b10; #10;
    s = 2'b11; #10;

    $finish;
end

endmodule
