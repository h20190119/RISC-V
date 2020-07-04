module Pipelinecontrol(input [31:0] ins_code, output reg alusrc, output reg writeback_ctrl, output reg mem_read,
output reg regwrite, output reg mem_write, output reg [2:0] alu_ctrl, output reg bge, output reg beq, output reg jalr);

always@(ins_code)
begin
case(ins_code[6:2])
5'b01100:begin
			alusrc=1'b0; writeback_ctrl=1'b1; mem_read=1'b0; regwrite=1'b1; mem_write=1'b0; bge=1'b0; beq=1'b0;
			jalr=1'b0; alu_ctrl=ins_code[30]?3'b001:3'b000;
			end
5'b00100:begin
			alusrc=1'b1; writeback_ctrl=1'b1; mem_read=1'b0; regwrite=1'b1; mem_write=1'b0; bge=1'b0; beq=1'b0;
			jalr=1'b0;
			case({ins_code[14],ins_code[12]})
			2'b00:alu_ctrl=3'b000;
			2'b01:alu_ctrl=3'b010;
			2'b11:alu_ctrl=ins_code[30]?3'b100:3'b011;
			default:alu_ctrl=3'bx;
			endcase
			end
5'b00000:begin
			alusrc=1'b1; writeback_ctrl=1'b0; mem_read=1'b1; regwrite=1'b1; mem_write=1'b0; bge=1'b0; beq=1'b0;
			jalr=1'b0; alu_ctrl=3'b000;
			end
5'b01000:begin
			alusrc=1'b1; writeback_ctrl=1'b0; mem_read=1'b0; regwrite=1'b0; mem_write=1'b1; bge=1'b0; beq=1'b0;
			jalr=1'b0; alu_ctrl=3'b000;
			end
5'b11000:begin
			alusrc=1'b0; writeback_ctrl=1'bx; mem_read=1'b0; regwrite=1'b0; mem_write=1'b0; jalr=1'b0; alu_ctrl=3'b001;
			bge=ins_code[12]; beq=~ins_code[12];
			end
5'b11001:begin
			alusrc=1'b1; writeback_ctrl=1'bx; mem_read=1'b0; regwrite=1'b0; mem_write=1'b0; bge=1'b0; beq=1'b0;
			jalr=1'b1; alu_ctrl=3'b000;
			end
default: begin
			alusrc=1'bx; writeback_ctrl=1'bx; mem_read=1'b0; regwrite=1'b0; mem_write=1'b0; bge=1'b0; beq=1'b0;
			jalr=1'b0; alu_ctrl=3'bx;
			end
endcase
end
endmodule
