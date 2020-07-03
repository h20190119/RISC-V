module RISCV_Mux4x1(I0,I1,I2,I3,SEL,OUT);

input [31:0]I0;
input [31:0]I1;
input [31:0]I2;
input [31:0]I3;
input [1:0]SEL;
output [31:0]OUT;

assign OUT = SEL[1]?(SEL[0]?I3:I2):(SEL[0]?I1:I0);
endmodule

