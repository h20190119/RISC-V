module RISCV_NPC(input clk,input [31:0]  PC,input [31:0] IMM,input [31:0] alu_result,input [1:0]  NPCop,output reg [31:0] NPC);
    
always @(*) 
begin
case(NPCop)
2'b00  : NPC = PC + 4;
2'b01  : NPC = PC + IMM - 3'd4;
2'b10  : NPC = PC + IMM - 3'd4;
2'b11  : NPC = alu_result;

endcase
end
    
endmodule
