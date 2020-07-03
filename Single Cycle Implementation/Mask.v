`timescale 1ns / 1ns

module Mask(a,b,s);

input [31:0] a;
output [31:0] b;
input s;

assign b = (s == 1'b1) ? a<<2 : a;

endmodule
