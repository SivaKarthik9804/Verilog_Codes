module comparator_1b(
    input a, b,
    output l, e, g
);

assign l = ~a & b;
assign e = ~(a ^ b);
assign g = a & ~b;

endmodule
    
module comparator_3b(
    input [2:0] a,
    input [2:0] b,
    output l, e, g
);

wire l2,e2,g2;
wire l1,e1,g1;
wire l0,e0,g0;

comparator_1b c2(a[2], b[2], l2, e2, g2);
comparator_1b c1(a[1], b[1], l1, e1, g1);
comparator_1b c0(a[0], b[0], l0, e0, g0);

assign g = g2 | (e2 & g1) | (e2 & e1 & g0);
assign l = l2 | (e2 & l1) | (e2 & e1 & l0);
assign e = e2 & e1 & e0;

endmodule

module comparator_3b_tb;
reg [2:0] a, b;
wire l, e, g;
integer i, j;

comparator_3b dut(.a(a),.b(b),.l(l),.e(e),.g(g));

initial begin
    $monitor("a=%b b=%b l=%b e=%b g=%b", a, b, l, e, g);
    for(i=0; i<8; i=i+1) begin
        for(j=0; j<8; j=j+1) begin
            a = i;
            b = j;
            #10;
        end
    end
    $finish;
end
endmodule
