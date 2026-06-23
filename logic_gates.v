module logic_gates(
    input a, b,
    output [6:0]y );

assign y[0] = a & b;    
assign y[1] = a | b;
assign y[2] = ~a;         
assign y[3] = ~(a & b);
assign y[4] = ~(a | b);   
assign y[5] = a ^ b;      
assign y[6] = ~(a ^ b); 
endmodule 


module logic_gates_tb;
reg a, b;
wire [6:0] y;

logic_gates dut(
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    $monitor("a=%b b=%b y=%b", a, b, y);
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;

    $finish;
end
endmodule
