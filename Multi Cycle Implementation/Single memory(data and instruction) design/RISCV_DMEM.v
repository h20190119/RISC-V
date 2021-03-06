module RISCV_DMEM(WRbe,DMwrite,addr,WriteData,ReadData,clk);
//512 for Dmem and 512 for Imem(beginning)

input DMwrite,clk;
input [3:0] WRbe;
input [31:0] addr;
input [31:0] WriteData;
output reg [31:0] ReadData;
reg [31:0] mem [0:1023];
integer i,j;
   
initial
begin
//R type instructions
mem[0] = 32'h002081b3; // ADD R3,R1,R2; (R3=1E)
mem[4] = 32'h002092b3; // SLL R5,R1,R2; (R5=00a000000)
mem[8] = 32'h0020d333; // SRL R6,R1,R2; (R6=0)
mem[12] = 32'h4020d3b3; // SRA R7,R1,R2; (R7=0)
mem[16] = 32'h0020f433; // AND R8,R1,R2; (R8=0)
mem[20] = 32'h0020a533; // SLT R10,R1,R2;(R10=1)
mem[24] = 32'h0020e4b3; // OR R9,R1,R2;  (R9=1E)
mem[28] = 32'h40208233; // SUB R4,R1,R2; (R4=FFFFFFF6)
mem[32] = 32'h0020ccb3; //XOR R25,R1,R2; (R25=1E)

//U type
mem[36] = 32'h00001fb7; //LUI R31,1; (R31=00001000) 
mem[40] = 32'h00002e17; //AUIPC R28,2;(R28=8232 or 2028 in hex)

//I type
mem[44] = 32'h00000013; // ADDI R0,R0,0;
mem[48] = 32'h00800f6f; //JAL R30,8 (R30=52 or 34 in hex)
mem[52] = 32'h00000000;
mem[56] = 32'h00000000;
mem[60] = 32'h0041c913; // XORI R18,R3,4; (R18=1A)
mem[64] = 32'h00100513; // ADDI R10,R0,1; (R10=1)
mem[68] = 32'h01035813; //SRLI R16,R6,16; (R16=0)
mem[72] = 32'h00402703; //LW R14,4[R0]; (R14=002092b3)
mem[76] = 32'h00501123; // SH R5,2[R0]; (MEM[2]=0)
mem[80] = 32'h0030de93; // SRAI R29,R1,3;(R29=1)
mem[84] = 32'h00800093; //ADDI R1,R0,8; (R1=8)
mem[88] = 32'h00802883; // LW R17,8[R0]; (R17=0020d333) 
mem[92] = 32'h00400113; //ADDI R2,R0,4; (R2=4)
mem[96] = 32'h0020e193; //ORI R3,R1,2; (R3=A)
mem[100] = 32'h00208663; //BEQ R1,R2,12 (No branch) //B type
mem[104] = 32'h00800113; //ADDI R2,R2,4; (R2=8)
mem[108] = 32'h00208463; //BEQ R1,R2,8;
mem[112] = 32'h00000000; //NOP
mem[116] = 32'h00000000; //NOP
mem[120] = 32'h00000013; // ADDI R0,R0,0;
mem[124] = 32'h00000013; // ADDI R0,R0,0;
mem[128] = 32'h1230ab13; //SLTI R22,R1,123; (R22=1)
mem[132] = 32'h1230fb93; //ANDI R23,R1,123; (R23=0)
mem[136] = 32'h00408c03; //LB R24,R1,4; (R24=FFFFFFB3,MEM[12])
mem[140] = 32'h0040cd03; //LBU R26,R1,4; (R26=000000B3)
mem[144] = 32'h00409c83; //LH R25,R1,4; (R25=FFFFD3B3)

//S type
mem[148] = 32'h122081a3; //SB R2,123(R1); 
mem[152] = 32'h122091a3; //SH R2,123(R1);
mem[156] = 32'h1220a1a3; //SW R2,123(R1);
//B type
mem[160] = 32'h00b39e63; //BNE R7,R11,28; 
mem[164] = 32'h00000000;
mem[168] = 32'h00000013; // ADDI R0,R0,0;
mem[172] = 32'h00000000;

for (j=172; j<512; j=j+1)
begin
mem[j]=0;
end
for (i=512; i<1024; i=i+1)
begin   
mem[i]=i*10; 
end
end
	
always @(posedge clk) 
begin
ReadData = mem[addr];

if(DMwrite)

if(WRbe[0]) mem[addr][7:0] <= WriteData[7:0];
if(WRbe[1]) mem[addr][15:8] <= WriteData[15:8];
if(WRbe[2]) mem[addr][23:16] <= WriteData[23:16];
if(WRbe[3]) mem[addr][31:24] <= WriteData[31:24];
end	
endmodule

