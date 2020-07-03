`timescale 1ns / 1ns

module RISCVmain(reset,clk);

input reset,clk;
wire[31:0] PC,PCin,m1,m2,m3,m4,m5;
wire [31:0] instruction,sb,sh,sw,lb,lh,lw,lbu,lhu;
wire Z,N;

//notations in the architecture
wire [31:0] fivec,oneb,onea,threec,sixb,five,threea,threeb,fivea,fiveb,sixa,six,fivec1;

//signals
wire [4:0] ALU_Ctrl;
wire A_select,mem_read,mem_write,B_select,mask,reg_write;
wire [1:0] wd_src,PC_src,store_select; 
wire [2:0] Imm_select,dm_select; 

ProgramCounter t1(.clk(clk),.rst(reset),.PCin(PCin),.PC(PC));

instr_mem t2(.inst(instruction),.pc(PC));

PCAdder t3(.PCResult(PC),.PCAddResult(onea));

sign t4(.m1(m1),.m2(m2),.m3(m3),.m4(m4),.m5(m5),.inst(instruction));

mux5x1 t5(.a(m1),.b(m2),.c(m3),.d(m4),.e(m5),.s(Imm_select),.out(threec));

Adder32 t6(.f(oneb),.a(threec),.b(onea-3'd4),.c(carry));

regFile t7(.clk(clk),.Ip1(five),.sel_i1(instruction[11:7]),.Op1(threea),.sel_o1(instruction[19:15]),.Op2(threeb),.sel_o2(instruction[24:20]),.reg_write(reg_write),.rst(reset));

mux4x1 t8(.a(onea),.b(fivec),.c(sixb),.d(threec),.sel(wd_src),.out(five)); //before regfile

mux2x1 t9(.a(onea-3'd4),.b(threea),.s(A_select),.out(fivea));

mux2x1 t10(.a(threeb),.b(threec),.s(B_select),.out(fiveb));

RISCVALU t11(.ALUcntrl(ALU_Ctrl),.A(fivea),.B(fiveb),.ALUOUT(fivec),.Z(Z),.N(N));

storeblock t12(.data(threeb),.sb(sb),.sh(sh),.sw(sw));

mux3x1 t13(.a(sw),.b(sh),.c(sb),.s0(store_select[0]),.s1(store_select[1]),.out(sixa));

data_memory t14(.dm_read(mem_read),.dm_write(mem_write),.addr(fivec),.wdata(sixa),.rdata(six));

loadblock t15(.data(six),.lb(lb),.lh(lh),.lw(lw),.lbu(lbu),.lhu(lhu));

mux5x1 t16(.a(lb),.b(lh),.c(lw),.d(lbu),.e(lhu),.s(dm_select),.out(sixb));

RISCVcontrol t17(.instruction(instruction),.Z(Z),.N(N),.ALU_Ctrl(ALU_Ctrl),.A_select(A_select),.mem_read(mem_read),.mem_write(mem_write),.B_select(B_select),.wd_src(wd_src),.mask(mask),.PC_src(PC_src),.store_select(store_select),.Imm_select(Imm_select),.dm_select(dm_select),.reg_write(reg_write));  

Mask t18(.a(fivec),.b(fivec1),.s(mask));

mux3x1 t19(.a(fivec1),.b(oneb),.c(onea),.s0(PC_src[0]),.s1(PC_src[1]),.out(PCin));

endmodule
