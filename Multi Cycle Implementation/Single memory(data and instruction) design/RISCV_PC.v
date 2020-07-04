module RISCV_PC(input clk,input rst,input PCwrite,input [31:0] NPC,output [31:0] PC);

reg [31:0] npc_reg;
    
always @(posedge clk)
begin
if(rst)
npc_reg <= 32'h00000000;
else if(PCwrite)
npc_reg = NPC;
end
    
assign PC = npc_reg;

endmodule
