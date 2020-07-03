`timescale 1ns / 1ns

// a synthesisable rom implementation
module instr_mem(inst,pc);
input [31:0] pc;
output reg [31:0] inst;
integer i;
reg [31:0] rom [1023:0];

initial  
begin  
//R type
                rom[0] = 32'h002081b3;  // ADD R3,R1,R2; (R3=1E)
                rom[4] = 32'h4020d3b3;  // SRA R7,R1,R2; (R7=0)
                rom[8] = 32'h002092b3;  // SLL R5,R1,R2; (R5=00a000000)
                rom[12] = 32'h0020f433; // AND R8,R1,R2; (R8=0)
                rom[16] = 32'h40208233; // SUB R4,R2,R1; (R4=FFFFFFF6)
                rom[20] = 32'h0020ccb3; // XOR R25,R1,R2; (R25=1E)
                rom[24] = 32'h00402703; // LW R14,4[R0]; (R14=4020d3b3)
                rom[28] = 32'h0041c913; // XORI R18,R3,4; (R18=1A)
                rom[32] = 32'h1230ab13; // SLTI R22,R1,123; (R22=1)
                rom[36] = 32'h00408c03; // LB R24,R1,4; (R24=FFFFFFB3,MEM[12])
                rom[40] = 32'h00001fb7; // LUI R31,1; (R31=00001000) 
                rom[44] = 32'h00002e17; // AUIPC R28,2;(R28=8232 or 2028 in hex)
                rom[48] = 32'h00b39e63; // BNE R7,R11,28; 
                rom[52] = 32'h1230b193; // sltiu
                rom[56] = 32'h1230c193; // xori 
                rom[60] = 32'h0030d193; // srli
//		rom[64]	= 32'h4030d193; //srai
//		rom[68]	= 32'h1230e193; //ori
//		rom[72]	= 32'h1230f193; //andi
//		rom[76]	= 32'h12308183; //lb
//		rom[80]	= 32'h1230c183; //lbu
//		rom[84]	= 32'h12309183; //lh
//		rom[88]	= 32'h1230d183; //lhu
//		rom[92]	= 32'h1230a183; //lw
//		rom[96]	= 32'h123081e7; //jalr
////s type
//		rom[100]= 32'h122081a3; //sb
//		rom[104]= 32'h122091a3; //sh
//		rom[108]= 32'h1220a1a3; //sw
////u type
//		rom[112]= 32'h123001b7; //lui
//		rom[116]= 32'h12300197; //auipc
////j type
//		rom[120]= 32'h600241ef; //jal
////b type
//		rom[124]= 32'h24208363; //beq
//		rom[128]= 32'h24209363; //bne
//		rom[132]= 32'h2420c363; //blt
//		rom[136]= 32'h2420d363; //bge
//		rom[140]= 32'h2420e363; //bltu
//		rom[144]= 32'h2420f363; //bgeu
//
for(i = 61; i < 1024; i = i + 1)
begin
rom[i]=0;
end
		
end  

always @(*)
begin
inst = rom[pc];
end

endmodule   