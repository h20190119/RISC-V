`timescale 1ns / 1ns

module mux5x1 (a,b,c,d,e,s,out);

input [31:0] a,b,c,d,e;
input [2:0] s;
output reg [31:0] out;


always @ (*)
begin

case (s)
3'b000 : out = a;
3'b001 : out = b;
3'b010 : out = c;
3'b011 : out = d;
3'b100 : out = e;
default : out =32'h00000000;

endcase
end
endmodule
