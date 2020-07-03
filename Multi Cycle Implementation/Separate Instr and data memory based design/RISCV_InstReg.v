module RISCV_InstReg(input Clk,input Rst,input i_Wr,input [31:0] i_Data,output [31:0] o_Instruction);

reg [31:0] r_Instruction;
assign o_Instruction = r_Instruction;

always @(posedge Clk or posedge Rst) 
begin

if(Rst)
begin
r_Instruction <= 0;
end 
else 
begin
if(i_Wr)
begin
r_Instruction <= i_Data;
end
end
end

endmodule
