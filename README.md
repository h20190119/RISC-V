# RISC-V

## RISC V RV32I Implementation

In this project, a RISC V CPU is implemented in verilog. It almost fully supports each type of RV32I instructions (excluding CSRs and FENCEs)
		

There are 3 different types of architectures that have been explored as part of this project. 

## Single Cycle Design

In this single cycle design methodology 38 instructions have been implemented. The clock cycle is decided by the instruction consuming the longest amount of time to execute. As there is one clock cycle to execute an instruction, any resource that is required more than once needs to be duplicated. As a consequence,the instruction and data memory have to be separately modelled. 


## Multi Cycle Design

In a multi cycle design any instruction execution is broken down in multiple steps.

### IF stage: 
Instruction fetch and PC increment
### ID stage: 
Instruction decode, register fetch and immediate value computation
### EX stage: 
Execution, memory address computation, or branch completion 
### MEM stage:
Memory access, store instruction, R type and I type instruction completion 
### WB stage:
Memory read and register writeback completion

Each instruction takes from 3 to 5 cycles to complete. 

## Pipeline Design

A 5 stage pipeline design, with data forwarding and stall unit has been implemented.




