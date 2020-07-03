`timescale 1ns / 1ns

module Adder32(f,a,b,c);
output reg [31:0] f;
output reg c;
input [31:0] a,b;

always @(*)
begin
{c,f}=a+b;
end
endmodule
