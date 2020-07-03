module RISCV_Imemory (input Clk,input Rst,input [31:0] Addr,output [31:0] o_RD);
   
reg [31:0] r_RD = 0;
assign o_RD = r_RD;

//The Ram block
reg [31:0] Ram [1023:0];

//Initalize the ram
integer i,address;
integer numRamUsed;

initial 
begin
//R type instructions
Ram[0] = 32'h002081b3; // ADD R3,R1,R2; (R3=1E)
Ram[1] = 32'h002092b3; // SLL R5,R1,R2; (R5=00a000000)
Ram[2] = 32'h0020d333; // SRL R6,R1,R2; (R6=0)
Ram[3] = 32'h4020d3b3; // SRA R7,R1,R2; (R7=0)
Ram[4] = 32'h0020f433; // AND R8,R1,R2; (R8=0)
Ram[5] = 32'h0020a533; // SLT R10,R1,R2;(R10=1)
Ram[6] = 32'h0020e4b3; // OR R9,R1,R2;  (R9=1E)
Ram[7] = 32'h40208233; // SUB R4,R1,R2; (R4=FFFFFFF6)
Ram[8] = 32'h0020ccb3; //XOR R25,R1,R2; (R25=1E)

//U type
Ram[9] = 32'h00001fb7; //LUI R31,1; (R31=00001000) 
Ram[10] = 32'h00002e17; //AUIPC R28,2;(R28=8232 or 2028 in hex)

//I type
Ram[11] = 32'h00000013; // ADDI R0,R0,0;
Ram[12] = 32'h00800f6f; //JAL R30,8 (R30=52 or 34 in hex)
Ram[13] = 32'h00000000;
Ram[14] = 32'h00000000;
Ram[15] = 32'h0041c913; // XORI R18,R3,4; (R18=1A)
Ram[16] = 32'h00100513; // ADDI R10,R0,1; (R10=1)
Ram[17] = 32'h01035813; //SRLI R16,R6,16; (R16=0)
Ram[18] = 32'h00202703; //LW R14,2[R0]; (R14=14)
Ram[19] = 32'h00501123; // SH R5,2[R0]; (MEM[2]=0)
Ram[20] = 32'h00802883; // LW R17,8[R0]; (R17=50)
Ram[21] = 32'h0030de93; // SRAI R29,R1,3;(R29=1)
Ram[22] = 32'h00800093; //ADDI R1,R0,8; (R1=8)
Ram[23] = 32'h00400113; //ADDI R2,R0,4; (R2=4)
Ram[24] = 32'h0020e193; //ORI R3,R1,2; (R3=A)
Ram[25] = 32'h00208663; //BEQ R1,R2,12 (No branch) //B type
Ram[26] = 32'h00800113; //ADDI R2,R2,4; (R2=8)
Ram[27] = 32'h00208463; //BEQ R1,R2,8;
Ram[28] = 32'h00000000; //NOP
Ram[29] = 32'h00000000; //NOP
Ram[30] = 32'h00000013; // ADDI R0,R0,0;
Ram[31] = 32'h00000013; // ADDI R0,R0,0;
Ram[32] = 32'h1230ab13; //SLTI R22,R1,123; (R22=1)
Ram[33] = 32'h1230fb93; //ANDI R23,R1,123; (R23=0)
Ram[34] = 32'h00208c03; //LB R24,R1,2; (R24= 64,MEM[10])
Ram[35] = 32'h0020cd03; //LBU R26,R1,2; (R26=64)
Ram[36] = 32'h00209c83; //LH R27,R1,2; (R27=64)

//S type
Ram[37] = 32'h122081a3; //SB R2,123(R1); 
Ram[38] = 32'h122091a3; //SH R2,123(R1);
Ram[39] = 32'h1220a1a3; //SW R2,123(R1);
//B type
Ram[40] = 32'h00b39e63; //BNE R7,R11,28; 
Ram[41] = 32'h00000000;
Ram[42] = 32'h00000013; // ADDI R0,R0,0;
Ram[43] = 32'h00000000;
numRamUsed = 44;

for(i = numRamUsed; i < 1024; i = i + 1)

begin
Ram[i] = 0;
end
end

always @(posedge Clk) 
begin
address <= Addr[31:0];
r_RD <= Ram[address/4];
end
endmodule
