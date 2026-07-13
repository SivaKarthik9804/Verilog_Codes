module multiplier2b(
    input a0, a1,
    input b0, b1,
    output p0, p1, p2, p3
);

wire w0, w1, w2, w3, c1;

and g1(w0, a0, b0);
and g2(w1, a1, b0);
and g3(w2, a0, b1);
and g4(w3, a1, b1);

assign p0 = w0;

xor g5(p1, w1, w2);
and g6(c1, w1, w2);

xor g7(p2, w3, c1);
and g8(p3, w3, c1);

endmodule


module multiplier2b_tb;
reg a0, a1;
reg b0, b1;
wire p0, p1, p2, p3;

multiplier2b dut(
    .a0(a0),
    .a1(a1),
    .b0(b0),
    .b1(b1),
    .p0(p0),
    .p1(p1),
    .p2(p2),
    .p3(p3)
);

initial begin

    $monitor("a0=%b a1=%b b0=%b b1=%b p0=%b p1=%b p2=%b p3=%b",
              a0,a1,b0,b1,p0,p1,p2,p3);

    a0=0; a1=0; b0=0; b1=0; #10;
    a0=1; a1=0; b0=1; b1=0; #10;
    a0=0; a1=1; b0=1; b1=1; #10;
    a0=1; a1=1; b0=1; b1=1; #10;

    $finish;
end

endmodule 

