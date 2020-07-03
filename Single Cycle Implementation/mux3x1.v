`timescale 1ns / 1ns

module mux3x1(a,b,c,s0,s1,out);

input [31:0] a,b,c;
input s0, s1;
output reg [31:0] out;
wire [1:0] t;
assign t= {s1,s0};


always@(*)
begin

case (t)
2'b00 : out <= a;
2'b01 : out <= b;
2'b10 : out <= c;
default : out <= 0;
endcase

end

endmodule
