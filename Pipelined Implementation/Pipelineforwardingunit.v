module Pipelineforwardingunit(input [4:0] id_ex_rs1, input [4:0] id_ex_rs2,
input [4:0] ex_mem_rd,input [4:0] mem_wb_rd, input ex_mem_rw,input mem_wb_rw,
output reg [1:0]forward_rs1,output reg [1:0]forward_rs2);

always@(*)
begin
if(((id_ex_rs1==ex_mem_rd)&&(ex_mem_rw==1)&&(ex_mem_rd!=5'b0))||((id_ex_rs2==ex_mem_rd)&&(ex_mem_rw==1)&&(ex_mem_rd!=5'b0)))
begin
forward_rs1=((id_ex_rs1==ex_mem_rd)&&(ex_mem_rw==1)&&(ex_mem_rd!=5'b0))?2'b01:2'b00;
forward_rs2=((id_ex_rs2==ex_mem_rd)&&(ex_mem_rw==1)&&(ex_mem_rd!=5'b0))?2'b01:2'b00;
end
else if(((id_ex_rs1==mem_wb_rd)&&(mem_wb_rw==1)&&(mem_wb_rd!=5'b0))||((id_ex_rs2==mem_wb_rd)&&(mem_wb_rw==1)&&(mem_wb_rd!=5'b0)))
begin
forward_rs1=((id_ex_rs1==mem_wb_rd)&&(mem_wb_rw==1)&&(mem_wb_rd!=5'b0))?2'b10:2'b00;
forward_rs2=((id_ex_rs2==mem_wb_rd)&&(mem_wb_rw==1)&&(mem_wb_rd!=5'b0))?2'b10:2'b00;
end
else
begin
forward_rs1=2'b00;
forward_rs2=2'b00;
end
end

endmodule
