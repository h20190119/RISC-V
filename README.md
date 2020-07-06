# RISC-V

RISC V RV32I Implementation
In this project, a RISC V CPU is implemented in verilog. It almost fully supports each type of RV32I instructions (excluding CSRs and FENCEs). The exact list of instructions that have been tested on this architecture is as follows:
U-type	J-type	B-type	I-type	S-type	R-type
LUI	JAL	BEQ	LB	SB	ADD
AUIPC		BNE	LH	SH	SUB
		BLT	LW	SW	SLL
		BGE	LBU		SLT
		BLTU	LHU		SLTU
		BGEU	ADDI		XOR
			SLTI		SRL
			SLTIU		SRA
			XORI		OR
			ORI		AND
			ANDI		
			SLLI		
			SRLI		
			JALR
		

There are 3 different types of architectures that have been explored as part of this project. 

Single Cycle Implementation





