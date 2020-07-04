module RISCV_InstReg(input Clk,input Rst,input instwrite,input [31:0] Data,output [31:0] Instruction);

reg [31:0] r_Instruction;
assign Instruction = r_Instruction;

always @(posedge Clk or posedge Rst) 
begin

if(Rst)
begin
r_Instruction <= 0;
end 
else 
begin
if(instwrite)
begin
r_Instruction <= Data;
end
end
end

endmodule
