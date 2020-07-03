`timescale 1ns / 1ns

module RISCVALU(ALUcntrl,A,B,ALUOUT,Z,N);

input [4:0] ALUcntrl;
input signed [31:0] A;
input signed [31:0] B;
output [31:0] ALUOUT;
output Z,N;
reg [31:0] r_Result = 32'b0;


assign ALUOUT = r_Result;
assign Z = (r_Result == 32'b0) ? 1'b1 : 1'b0;

assign N = (r_Result[31]==1)?1'b1 : 1'b0;


//The various ALU operations
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

always@(*)
begin
case(ALUcntrl)

	    ALU_ADD:begin
                r_Result = A + B; //ADD,ADDI
            end
            ALU_SUB:begin
                r_Result = A - B;//SUB,SUBI,BEQ,BNE
            end  
            ALU_AND:begin
                r_Result = A & B; //AND,ANDI
            end  
            ALU_OR:begin
                r_Result = A | B; //OR,ORI
            end
            ALU_XOR:begin
                r_Result = A ^ B; //XOR,XORI
            end  
            ALU_SLL:begin
                r_Result = A << B[4:0]; //SLL,SLLI
            end  
            ALU_SRL:begin
                r_Result = A >> B[4:0]; //SRL,SRLI
            end  
            ALU_SRA:begin
                r_Result = A >>> B[4:0]; //SRA,SRAI
            end  
            ALU_SLT:begin
                r_Result = (A < B)? 1:0; //SLT,SLTI
            end
            ALU_LUI:begin
                r_Result = B; //LUI
            end
            ALU_SLTU:begin
                r_Result = ({1'b0,A} < {1'b0,B})? 1:0; //SLT,SLTI
            end
            ALU_BGEU:begin
                r_Result = ({1'b0,A} > {1'b0,B})? 0:1; //BGEU
            end
            ALU_BGE:begin
                r_Result = (A > B)? 0:1; //BGE
            end
            ALU_ADDPC:begin
                r_Result = A + 4; //ADD +4 to PC
            end
            ALU_JBADDRESS:begin
                r_Result = A - 4 + B; //JAL (PC+immediate)
            end
            ALU_BNE:begin
                r_Result = (A!= B)? 0:1; //BNE
            end
            ALU_BLT:begin
                r_Result = (A < B)? 0:1; //BLT
            end
            ALU_BLTU:begin
                r_Result = ({1'b0,A} < {1'b0,B})? 0:1; //BLTU
            end
            default:begin
                r_Result = 0; 
            end
        endcase
    end

endmodule

