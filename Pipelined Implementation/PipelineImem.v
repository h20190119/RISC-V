module PipelineImem(input [31:0] PC, input reset, output [31:0] instruction_code);

reg [7:0] mem [80:0];
assign instruction_code={mem[PC+3],mem[PC+2],mem[PC+1],mem[PC]};

initial
begin
mem[0]=8'h03;
mem[1]=8'ha3;
mem[2]=8'h00;
mem[3]=8'h00;
mem[4]=8'h13;
mem[5]=8'h03;
mem[6]=8'h13;
mem[7]=8'h00;
mem[8]=8'h03;
mem[9]=8'hae;
mem[10]=8'h00;
mem[11]=8'h00;
mem[12]=8'h83;
mem[13]=8'hae;
mem[14]=8'h40;
mem[15]=8'h00;
mem[16]=8'hb3;
mem[17]=8'h0e;
mem[18]=8'hde;
mem[19]=8'h01;
mem[20]=8'h23;
mem[21]=8'ha4;
mem[22]=8'hd2;
mem[23]=8'h01;
mem[24]=8'h93;
mem[25]=8'h82;
mem[26]=8'h42;
mem[27]=8'h00;
mem[28]=8'h13;
mem[29]=8'h03;
mem[30]=8'h13;
mem[31]=8'h00;
mem[32]=8'h63;
mem[33]=8'h14;
mem[34]=8'h03;
mem[35]=8'h00;
mem[36]=8'hef;
mem[37]=8'hf0;
mem[38]=8'h5f;
mem[39]=8'hfe;
end

always@(reset)
begin
if (reset==0)
$readmemh("Instruction.mem", mem);
end
endmodule

