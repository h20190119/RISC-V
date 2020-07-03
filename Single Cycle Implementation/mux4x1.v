`timescale 1ns / 1ns

module mux4x1(a,b,c,d,sel,out);

input [31:0] a,b,c,d;
input [1:0] sel;
output[31:0] out;

assign out = sel[1]?(sel[0]?d:c):(sel[0]?b:a);


endmodule
