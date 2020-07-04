module PipelineALU(input [31:0] a, input [31:0] b, input[2:0] ctrl,input bge, input beq, input jalr, input [31:0] pc, input [31:0] offset,
output reg branch_true, output reg [31:0] branched_pc, output reg[31:0] out);
	 
always@(ctrl,a,b)
begin
case(ctrl)
3'b000: out=a+b;
3'b001: out=a-b;
3'b010: out=a<<b;
3'b011: out=a>>b;
3'b100: out=a>>>b;
default: out=32'bx;
endcase
end

always@(beq,bge,offset,pc,jalr,out)
begin
if(beq==1)
begin
if(out==32'b0)
begin
branch_true=1'b1;
branched_pc=pc+4+offset;
end
end
else if(bge==1)
begin
if(out[31]==1'b0)
begin
branch_true=1'b1;
branched_pc=pc+4+offset;
end
end
else if(jalr==1)
begin
branch_true=1'b1;
branched_pc=pc+out;
end
end
endmodule
