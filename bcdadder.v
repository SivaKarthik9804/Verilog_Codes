module bcdadder(
    input [3:0]a,
    input [3:0]b,
    output reg [7:0]sum
  );
     reg [7:0]temp;
     always @(*) begin

    if(a <= 4'd9 && b <= 4'd9) begin

        temp = a + b;

        if(temp > 5'd9) begin
            temp = temp + 5'd6;
            sum[7:4] = 4'b0001;
            sum[3:0] = temp[3:0];
        end
        else begin
            sum[7:4] = 4'b0000;
            sum[3:0] = temp[3:0];
        end

    end
    else begin
        sum = 8'b00000000;
    end

end
endmodule

 module bcdadder_tb;
   reg [3:0]a;
   reg [3:0]b;
   wire [7:0] sum;

   integer i, j;
   bcdadder dut ( .a(a), .b(b), .sum(sum) );
   initial begin
     $monitor ("a=%b b=%b sum=%b", a, b, sum );
    for(i=0; i<=9; i=i+1) begin
        for(j=0; j<=9; j=j+1) begin
            a = i;
            b = j;
            #10;
        end
    end
    $finish;
  end
endmodule
     

