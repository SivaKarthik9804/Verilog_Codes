module parity_generator(
    input [2:0]d,
    output reg y 
  );
  always @ (*) begin
    case(d)
// EvenParity
     /* 3'b000 : y=1'b0;
      3'b001 : y=1'b1;
      3'b010 : y=1'b1;
      3'b011 : y=1'b0;
      3'b100 : y=1'b1;
      3'b101 : y=1'b0;
      3'b110 : y=1'b0;
      3'b111 : y=1'b1;
     default : y=1'bx;*/
// OddParity 
      3'b000 : y=1'b1;
      3'b001 : y=1'b0;
      3'b010 : y=1'b0;
      3'b011 : y=1'b1;
      3'b100 : y=1'b0;
      3'b101 : y=1'b1;
      3'b110 : y=1'b1;
      3'b111 : y=1'b0;
     default : y=1'bx;
   endcase
 end
 endmodule

 module parity_generator_tb;
   reg [2:0]d;
   wire y;

   parity_generator dut ( .d(d), .y(y) );
   initial begin
     $monitor ( "d=%b y=%b", d, y);
     d=3'b000;
#10  d=3'b001;
#10  d=3'b010;
#10  d=3'b011;
#10  d=3'b100;
#10  d=3'b101;
#10  d=3'b110;
#10  d=3'b111;
#10  $finish;
end
endmodule


