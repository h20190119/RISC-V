`timescale 1ns / 1ns

module RISCVcontrol(instruction,Z,N,ALU_Ctrl,A_select,mem_read,mem_write,B_select,wd_src,mask,PC_src,store_select,Imm_select,dm_select,reg_write);  

input [31:0] instruction;
input Z,N; 
output reg [4:0] ALU_Ctrl;
output reg A_select,mem_read,mem_write,B_select,mask,reg_write;  
output reg [1:0] wd_src,PC_src,store_select;  
output reg [2:0] Imm_select,dm_select; 

wire [10:0]opcode;

parameter ALU_ADD   = 5'b00001;
parameter ALU_SUB   = 5'b00010;
parameter ALU_AND   = 5'b00011;
parameter ALU_OR    = 5'b00100;
parameter ALU_XOR   = 5'b00101;
parameter ALU_SLL   = 5'b00110;
parameter ALU_SRL   = 5'b00111;
parameter ALU_SRA   = 5'b01000;
parameter ALU_SLT   = 5'b01001;
parameter ALU_LUI   = 5'b01010;
parameter ALU_SLTU  = 5'b01011;
parameter ALU_BGE   = 5'b01100;
parameter ALU_BGEU  = 5'b01101;
parameter ALU_ADDPC  = 5'b01110;
parameter ALU_JBADDRESS = 5'b01111;
parameter ALU_BNE    = 5'b10000;
parameter ALU_BLT    = 5'b10001;
parameter ALU_BLTU    = 5'b10010;

assign opcode= {instruction[30],instruction[14:12],instruction[6:0]};

always@(instruction)
begin
case(opcode)

//R type
11'b00000110011: begin  //add

		ALU_Ctrl = ALU_ADD;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01; //ALU output
		PC_src = 2'b10; //PC+4
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b10000110011: begin  //sub

		ALU_Ctrl = ALU_SUB;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01; //ALU output
		PC_src = 2'b10; //PC+4
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b00010110011: begin  //sll

		ALU_Ctrl = ALU_SLL;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01; //ALU output
		PC_src = 2'b10; //PC+4
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b01010110011: begin  //srl

		ALU_Ctrl = ALU_SRL;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01; //ALU output
		PC_src = 2'b10; //PC+4
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b11010110011: begin  //sra

		ALU_Ctrl = ALU_SRA;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01; //ALU output
		PC_src = 2'b10; //PC+4
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b01110110011: begin  //and

		ALU_Ctrl = ALU_AND;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01; //ALU output
		PC_src = 2'b10; //PC+4
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b01100110011: begin  //or

		ALU_Ctrl = ALU_OR;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01; //ALU output
		PC_src = 2'b10; //PC+4
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b01000110011: begin  //xor

		ALU_Ctrl = ALU_XOR;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01; //ALU output
		PC_src = 2'b10; //PC+4
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b00100110011: begin  //slt

		ALU_Ctrl = ALU_SLT;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01; //ALU output
		PC_src = 2'b10; //PC+4
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b00110110011: begin  //sltu

		ALU_Ctrl = ALU_SLTU;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01; //ALU output
		PC_src = 2'b10; //PC+4
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end
//I type

11'b00000010011: begin  //addi

                ALU_Ctrl = ALU_ADD;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01;
		PC_src = 2'b10;
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b00010010011: begin  //slli

                ALU_Ctrl = ALU_SLL;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01;
		PC_src = 2'b10;
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b00100010011: begin  //slti

                ALU_Ctrl = ALU_SLT;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01;
		PC_src = 2'b10;
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b00110010011: begin  //sltiu

                ALU_Ctrl = ALU_SLTU;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01;
		PC_src = 2'b10;
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b01000010011: begin  //xori

                ALU_Ctrl = ALU_XOR;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01;
		PC_src = 2'b10;
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b01010010011: begin  //srli

                ALU_Ctrl = ALU_SRL;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01;
		PC_src = 2'b10;
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b11010010011: begin  //srai

                ALU_Ctrl = ALU_SRA;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01;
		PC_src = 2'b10;
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b01100010011: begin  //ori

                ALU_Ctrl = ALU_OR;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01;
		PC_src = 2'b10;
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b01110010011: begin  //andi

                ALU_Ctrl = ALU_AND;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01;
		PC_src = 2'b10;
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //default
         	end

11'b00000000011: begin  //lb

                ALU_Ctrl = ALU_ADD;
		A_select = 1'b1;
		mem_read = 1'b1;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b10;
		PC_src = 2'b10;
		store_select = 2'b00; //default
		Imm_select = 3'b000; //default
		dm_select = 3'b000; //select LB
         	end


11'b01000000011: begin  //lbu

                ALU_Ctrl = ALU_ADD;
		A_select = 1'b1;
		mem_read = 1'b1;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b10;
		PC_src = 2'b10;
		store_select = 2'b00;
		Imm_select = 3'b000;
		dm_select = 3'b011;
         	end

11'b00010000011: begin  //lh

                ALU_Ctrl = ALU_ADD;
		A_select = 1'b1;
		mem_read = 1'b1;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b10;
		PC_src = 2'b10;
		store_select = 2'b00;
		Imm_select = 3'b000;
		dm_select = 3'b001;
         	end

11'b01010000011: begin  //lhu

                ALU_Ctrl = ALU_ADD;
		A_select = 1'b1;
		mem_read = 1'b1;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b10;
		PC_src = 2'b10;
		store_select = 2'b00;
		Imm_select = 3'b000;
		dm_select = 3'b100;
         	end

11'b00100000011: begin  //lw

                ALU_Ctrl = ALU_ADD;
		A_select = 1'b1;
		mem_read = 1'b1;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b10;
		PC_src = 2'b10;
		store_select = 2'b00;
		Imm_select = 3'b000;
		dm_select = 3'b010;
         	end

11'b00001100111: begin  //jalr

                ALU_Ctrl = ALU_ADD;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b1;
		reg_write = 1'b1;
		wd_src = 2'b00;
		PC_src = 2'b00; //select JALR address
		store_select = 2'b00;
		Imm_select = 3'b000;
		dm_select = 3'b000;
         	end
//s type

11'b00000100011: begin  //sb

                ALU_Ctrl = ALU_ADD;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b1;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b0;
		wd_src = 2'b10;
		PC_src = 2'b10;
		store_select = 2'b10;
		Imm_select = 3'b001;
		dm_select = 3'b000;
         	end

11'b00010100011: begin  //sh

                ALU_Ctrl = ALU_ADD;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b1;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b0;
		wd_src = 2'b10;
		PC_src = 2'b10;
		store_select = 2'b01;
		Imm_select = 3'b001;
		dm_select = 3'b000;
         	end

11'b00100100011: begin  //sw

                ALU_Ctrl = ALU_ADD;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b1;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b0;
		wd_src = 2'b10;
		PC_src = 2'b10;
		store_select = 2'b00;
		Imm_select = 3'b001;
		dm_select = 3'b000;
         	end

//u type
11'b00010110111: begin  //lui

                ALU_Ctrl = ALU_LUI;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01;
		PC_src = 2'b10;
		store_select = 2'b00;
		Imm_select = 3'b010;
		dm_select = 3'b000;
         	end

11'b00100010111: begin  //auipc

                ALU_Ctrl = ALU_ADD;
		A_select = 1'b0;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b1;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01;
		PC_src = 2'b10;
		store_select = 2'b00;
		Imm_select = 3'b010;
		dm_select = 3'b000;
         	end

//b type

11'b00001100011: begin  //beq

                ALU_Ctrl = ALU_SUB;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b0;
		wd_src = 2'b01;
		store_select = 2'b00;
		Imm_select = 3'b100;
		dm_select = 3'b000;
		if(Z==1'b1)
		PC_src = 2'b01;//take branch address
		else
		PC_src = 2'b10;
         	end

11'b00011100011: begin  //bne

                ALU_Ctrl = ALU_BNE;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b0;
		wd_src = 2'b01;
		store_select = 2'b00;
		Imm_select = 3'b100;
		dm_select = 3'b000;
		if(Z==1'b1)
		PC_src = 2'b01;
		else
		PC_src = 2'b10;
         	end

11'b01001100011: begin  //blt

                ALU_Ctrl = ALU_BLT;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b0;
		wd_src = 2'b01;
		store_select = 2'b00;
		Imm_select = 3'b100;
		dm_select = 3'b000;
		if(Z==1'b1)
		PC_src = 2'b01;
		else
		PC_src = 2'b10;
         	end


11'b01011100011: begin  //bge

                ALU_Ctrl = ALU_BGE;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b0;
		wd_src = 2'b01;
		store_select = 2'b00;
		Imm_select = 3'b100;
		dm_select = 3'b000;
		if(Z==1'b1)
		PC_src = 2'b01;
		else
		PC_src = 2'b10;
         	end

11'b01101100011: begin  //bltu

                ALU_Ctrl = ALU_BLTU;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b0;
		wd_src = 2'b01;
		store_select = 2'b00;
		Imm_select = 3'b100;
		dm_select = 3'b000;
		if(Z==1'b1)
		PC_src = 2'b01;
		else
		PC_src = 2'b10;
         	end

11'b01111100011: begin  //bgeu

                ALU_Ctrl = ALU_BGEU;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b0;
		wd_src = 2'b01;
		store_select = 2'b00;
		Imm_select = 3'b100;
		dm_select = 3'b000;
		if(Z==1'b1)
		PC_src = 2'b01;
		else
		PC_src = 2'b10;
         	end

default: begin  

		ALU_Ctrl = ALU_ADD;
		A_select = 1'b1;
		mem_read = 1'b0;
		mem_write = 1'b0;
		B_select = 1'b0;
		mask = 1'b0;
		reg_write = 1'b1;
		wd_src = 2'b01;
		PC_src = 2'b10;
		store_select = 2'bxx;
		Imm_select = 3'b000;
		dm_select = 3'bxxx;
         	end


endcase
end
endmodule



