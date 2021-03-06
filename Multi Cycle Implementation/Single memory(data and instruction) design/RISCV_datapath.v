module RISCV_datapath(input clk,input rst);


//control signals
wire Regwrite; //RegfileWrite enable
wire DMwrite; //data mem write enable
wire PCwrite; //PCwrite enable
wire instwrite; //Inst reg write enable 
wire Asel; //selecting A input of ALU
wire Bsel; //selecting B input of ALU
wire Zero; //zero flag
wire Zero_r; 
wire Addsel; //selecting the address of memory(PC or ALUOut)
wire [4:0] ALUop;
wire [2:0] DMalign;
wire [1:0]   NPCop;
wire [1:0]   WDsel;


wire [31:0]  PC;  
wire [31:0]  NPC; 
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
wire [31:0] memaddr;  


assign opcode = instr[6:0];  
assign rd     = instr[11:7];  
assign func3  = instr[14:12]; 
assign rs1    = instr[19:15]; 
assign rs2    = instr[24:20]; 
assign func7  = instr[31:25]; 


RISCV_PC r1(.clk(clk),.rst(rst),.PCwrite(PCwrite),.NPC(NPC),.PC(PC));

RISCV_NPC r2(.clk(clk),.PC(PC),.IMM(Imm32),.alu_result(C_r),.NPCop(NPCop),.NPC(NPC));

RISCV_InstReg r4(.Clk(clk),.Rst(rst),.instwrite(instwrite),.Data(dm_dout),.Instruction(instr));

RISCV_Immgen r5(.OpCode(opcode),.Inst(instr),.Immediate(Imm32));

RISCV_Regfile r6(.Clk(clk),.Rst(rst),.Addr1(rs1),.Addr2(rs2),.Addr3(rd),.RD1(RD1),.RD2(RD2),.Regwrite(Regwrite),.Inputs(WD));

RISCV_storagereg r7(.clk(clk),.rst(rst),.din(RD1),.dout(RD1_r));

RISCV_storagereg r8(.clk(clk),.rst(rst),.din(RD2),.dout(RD2_r));

RISCV_Mux2x1 r9(.d0(RD1_r),.d1(PC-3'd4),.sel(Asel),.out(A));

RISCV_Mux2x1 r10(.d0(RD2_r),.d1(Imm32),.sel(Bsel),.out(B));

RISCV_ALU r11(.clk(clk),.OpCode(ALUop),.w_SrcA(A),.w_SrcB(B),.Result(C),.Zero(Zero));

RISCV_flagstorage r12(.clk(clk),.rst(rst),.din(Zero),.dout(Zero_r));

RISCV_storagereg r13(.clk(clk),.rst(rst),.din(C),.dout(C_r));

RISCV_Mux2x1 r14(.d0(PC),.d1(C_r),.sel(Addsel),.out(memaddr));

RISCV_DMEM r15(.WRbe(WRbe),.DMwrite(DMwrite),.addr(memaddr),.WriteData(RD2_r),.ReadData(dm_dout),.clk(clk));

RISCV_storagereg r16(.clk(clk),.rst(rst),.din(dm_dout),.dout(DR_out));

RISCV_EXTDM r17(.dmout(DR_out),.DMalign(DMalign),.DMout(DM_dout));

RISCV_Mux4x1 r18(.I0(32'h0),.I1(C_r),.I2(DM_dout),.I3(PC),.SEL(WDsel),.OUT(WD));

RISCV_Controlunit r19(
 .clk(clk),
 .rst(rst),
 .Zero(Zero_r),
 .opcode(opcode),
 .func3(func3),
 .func7(func7),  
 .Regwrite(Regwrite), 
 .DMwrite(DMwrite), 
 .PCwrite(PCwrite), 
 .Instwrite(instwrite), 
 .ALUop(ALUop), 
 .DMalign(DMalign), 
 .WDsel(WDsel),  
 .WRbe(WRbe), 
 .Asel(Asel),
 .Bsel(Bsel),
 .NPCop(NPCop),
 .Addsel(Addsel));

endmodule





