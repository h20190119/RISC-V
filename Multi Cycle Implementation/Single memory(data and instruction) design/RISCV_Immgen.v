module RISCV_Immgen(input [6:0] OpCode,input [31:0] Inst,output reg [31:0] Immediate);

//Opcodes that require immediates
parameter InstType_B      = 7'b1100011;
parameter InstType_S      = 7'b0100011;
parameter InstType_I      = 7'b0010011;
parameter InstType_L      = 7'b0000011;
parameter InstType_JALR   = 7'b1100111;
parameter InstType_LUI    = 7'b0110111;
parameter InstType_AUIP   = 7'b0010111;
parameter InstType_JAL    = 7'b1101111;

always @(*) 
begin
case(OpCode)
InstType_B:begin
Immediate = {{20{Inst[31]}}, Inst[7], Inst[30:25], Inst[11:8], 1'b0};
end
InstType_S:begin
Immediate = {{21{Inst[31]}}, Inst[30:25], Inst[11:8], Inst[7]};
end
InstType_I:begin
Immediate = {{21{Inst[31]}}, Inst[30:20]};
end
InstType_L:begin
Immediate = {{21{Inst[31]}}, Inst[30:20]};
end
InstType_JALR:begin
Immediate = {{21{Inst[31]}}, Inst[30:20]};
end
InstType_LUI:begin
Immediate = {Inst[31:12], 12'b0};
end
InstType_AUIP:begin
Immediate = {Inst[31:12], 12'b0};
end
InstType_JAL:begin
Immediate = {{12{Inst[31]}}, Inst[19:12], Inst[20], Inst[30:21], 1'b0};
end
default:begin
Immediate = 32'b0;
end
endcase
end

endmodule
