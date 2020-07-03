module RISCV_datapath(input clk,input rst);


//control signals
wire RFWr; //RegfileWr
wire DMWr; //data mem write enable
wire PCWr; //PCwrite enable
wire IRWr; //Inst reg write enable 
wire Asel; //selecting A input of ALU
wire Bsel; //selecting B input of ALU
wire Zero; //zero flag
wire Zero_r; 
wire [4:0] ALUop;
wire [2:0] DMEXTop;
wire [1:0]   NPCop;
wire [1:0]   WDsel;


wire [31:0]  PC;  
wire [31:0]  NPC; 
wire [31:0]  im_dout;
wire [31:0]  dm_dout;
wire [31:0]  DM_dout;
wire [3:0]   WRbe;   
wire [31:0]  DR_out; 
wire [31:0]  instr;  
wire [6:0]   opcode; 
wire [4:0]   rd;  
wire [4:0]   rs1; 
wire [4:0]   rs2; 
wire [2:0]   func3;
wire [6:0]   func7;
wire [31:0]  Imm32;
wire [31:0]  WD;   
wire [31:0]  RD1;  
wire [31:0]  RD1_r;
wire [31:0]  RD2;  
wire [31:0]  RD2_r;
wire [31:0]  A;    
wire [31:0]  B;    
wire [31:0]  C;    
wire [31:0]  C_r;
//wire [31:0] ALUOut;  


assign opcode = instr[6:0];  
assign rd     = instr[11:7];  
assign func3  = instr[14:12]; 
assign rs1    = instr[19:15]; 
assign rs2    = instr[24:20]; 
assign func7  = instr[31:25]; 


RISCV_PC r1(.clk(clk),.rst(rst),.PCwr(PCWr),.NPC(NPC),.PC(PC));

RISCV_NPC r2(.clk(clk),.PC(PC),.IMM(Imm32),.alu_result(C_r),.NPCop(NPCop),.NPC(NPC));

RISCV_Imemory r3(.Clk(clk),.Rst(rst),.Addr(PC),.o_RD(im_dout));

RISCV_InstReg r4(.Clk(clk),.Rst(rst),.i_Wr(IRWr),.i_Data(im_dout),.o_Instruction(instr));

RISCV_Immgen r5(.i_OpCode(opcode),.i_Inst(instr),.o_Immediate(Imm32));

RISCV_Regfile r6(.Clk(clk),.Rst(rst),.i_Addr1(rs1),.i_Addr2(rs2),.i_Addr3(rd),.o_RD1(RD1),.o_RD2(RD2),.i_WE(RFWr),.i_WDSrc(WDsel),.w_Inputs(WD));

RISCV_storagereg r7(.clk(clk),.rst(rst),.din(RD1),.dout(RD1_r));

RISCV_storagereg r8(.clk(clk),.rst(rst),.din(RD2),.dout(RD2_r));

RISCV_Mux2x1 r9(.d0(RD1_r),.d1(PC-3'd4),.sel(Asel),.out(A));

RISCV_Mux2x1 r10(.d0(RD2_r),.d1(Imm32),.sel(Bsel),.out(B));

RISCV_ALU r11(.clk(clk),.i_OpCode(ALUop),.w_SrcA(A),.w_SrcB(B),.o_Result(C),.o_Zero(Zero));

RISCV_flagstorage r12(.clk(clk),.rst(rst),.din(Zero),.dout(Zero_r));

RISCV_storagereg r13(.clk(clk),.rst(rst),.din(C),.dout(C_r));

RISCV_DMEM r14(.WRbe(WRbe),.DMwr(DMWr),.addr(C_r),.WriteData(RD2_r),.ReadData(dm_dout),.clk(clk));

RISCV_storagereg r15(.clk(clk),.rst(rst),.din(dm_dout),.dout(DR_out));

RISCV_EXTDM r16(.dmout(DR_out),.DMEXTop(DMEXTop),.DMout(DM_dout));

RISCV_Mux4x1 r17(.I0(32'h0),.I1(C_r),.I2(DM_dout),.I3(PC),.SEL(WDsel),.OUT(WD));

RISCV_Controlunit r18(
 .clk(clk),
 .rst(rst),
 .Zero(Zero_r),
 .opcode(opcode),
 .func3(func3),
 .func7(func7),  
 .RFWr(RFWr), 
 .DMWr(DMWr), 
 .PCWr(PCWr), 
 .IRWr(IRWr), 
 .ALUop(ALUop), 
 .DMEXTop(DMEXTop), 
 .WDsel(WDsel),  
 .WRbe(WRbe), 
 .Asel(Asel),
 .Bsel(Bsel),
 .NPCop(NPCop));

endmodule





