module PiplineRISCV(input clk,input reset);

reg [69:0] if_id;
reg [159:0]id_ex; 
reg [110:0] ex_mem; 
reg [108:0] mem_wb;
wire [31:0] branched_pc, instruction_code,old_pc,writetoreg,reg_data1,reg_data2,immediate,alumux_in1,alumux_in2,alu_in2,alu_out,memread_data;
wire branch_true,jal,alusrc,writeback_ctrl,mem_read,mem_write,regwrite,bge,beq,jalr,stall,gated_clock;
wire[4:0] ra;
wire[2:0] alu_ctrl;
wire [1:0] forward_rs1,forward_rs2;


Pipelineinstfetch r1(clk,reset,stall,branched_pc,branch_true,instruction_code,jal,old_pc,ra);
Pipelineregisterfile r2(if_id[25:21],if_id[30:26],mem_wb[6:2], writetoreg,reset,mem_wb[1],mem_wb[71],mem_wb[76:72],mem_wb[108:77],reg_data1,reg_data2);
RISCV_Immgen r3(if_id[37:6],immediate);
Pipelinecontrol r4(if_id[37:6],alusrc,writeback_ctrl,mem_read,regwrite,mem_write,alu_ctrl,bge,beq,jalr);
Pipelinestalldetect r5(if_id[25:21],if_id[30:26],if_id[12:8],id_ex[15:11],id_ex[8],stall);
Pipelineforwardingunit fu1(id_ex[25:21],id_ex[20:16],ex_mem[8:4],mem_wb[6:2],ex_mem[2],mem_wb[1],forward_rs1,forward_rs2);
Pipelineforwardingmux fm1(id_ex[89:58],id_ex[57:26],ex_mem[72:41],mem_wb[38:7],forward_rs1,forward_rs2,alumux_in1,alumux_in2);
PipelineALUmux am1(id_ex[121:90],alumux_in2,id_ex[3],id_ex[7],alu_in2);
PipelineALU a1(alumux_in1,alu_in2,id_ex[2:0],id_ex[6],id_ex[5],id_ex[4],id_ex[153:122],id_ex[121:90],branch_true,branched_pc,alu_out);
PipelineDmem dm1(ex_mem[72:41],ex_mem[40:9],ex_mem[1],ex_mem[0],reset,memread_data);
Pipelinewriteback wb1(mem_wb[70:39],mem_wb[38:7],mem_wb[0],writetoreg);

always@(posedge clk or negedge reset)
begin
if(reset==0)
begin
if_id<=70'b0;
id_ex<=160'b0;
ex_mem<=111'b0;
mem_wb<=109'b0;
end

else
begin
ex_mem<={id_ex[153:122],id_ex[159:154],alu_out,alumux_in2,id_ex[15:11],id_ex[10],id_ex[9],id_ex[8],id_ex[7]};
mem_wb<={ex_mem[110:79],ex_mem[78:73],ex_mem[72:41],memread_data,ex_mem[8:4],ex_mem[2],ex_mem[3]};
if(stall==1'b0)
begin
if(branch_true==1'b1)
begin
if_id<=70'b0;
id_ex<=160'b0;
end
else begin
if_id<={old_pc,instruction_code,ra,jal};
id_ex<={if_id[5:0],if_id[69:38],immediate,reg_data1,reg_data2,if_id[25:21],if_id[30:26],if_id[17:13],
	writeback_ctrl,regwrite,mem_read,mem_write,bge,beq,jalr,alusrc,alu_ctrl};
end
end
else begin
id_ex<=160'b0;
end
end
end
endmodule

