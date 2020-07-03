`timescale 1ns / 1ns

//sign extension, shift and shuffle logic

module sign(m1,m2,m3,m4,m5,inst);
output reg [31:0] m1,m2,m3,m4,m5;
input [31:0] inst;

always@(*)
begin

m1= {{21{inst[31]}}, inst[30:20]};
m2= {{21{inst[31]}}, inst[30:25], inst[11:8], inst[7]};
m3= {inst[31:12], 12'b0};
m4= {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0};
m5= {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};
end
endmodule
