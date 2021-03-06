`timescale 1ns / 1ns

module ProgramCounter(clk,rst,PCin,PC);

input clk,rst;
input [31:0] PCin;
output reg [31:0] PC;

 
initial 
begin	
PC = 32'h00000000;
end

always @(posedge clk or posedge rst)
begin
if(rst)
begin
PC=32'h00000000;
end
else
begin
PC=PCin;
end
end
endmodule
