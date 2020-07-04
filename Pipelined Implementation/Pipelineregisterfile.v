module Pipelineregisterfile(input [4:0] read_reg1,input [4:0] read_reg2, input[4:0] write_reg, input [31:0] write_data, 
input reset, input regwrite, input jal, input [4:0] ra, input [31:0] pc,output [31:0] read_data1, output [31:0] read_data2);

reg [31:0] regmem [31:0];


integer i;
    initial 
    begin
        for(i = 0; i < 32; i = i + 1)
        begin
            regmem[i] = i*10;
        end
    end


always@(reset,jal,ra,pc)
begin
if (reset==0)
$readmemh("Registerfile.mem",regmem);
else
begin
if((jal==1)&&(ra!=5'b0))
regmem[ra]=pc+4;
end
end

always@(regwrite,write_data,write_reg)
begin
if ((regwrite==1)&&(write_reg!=5'b0))
regmem[write_reg]=write_data;
end


assign read_data1 =regmem[read_reg1];
assign read_data2 =regmem[read_reg2];

endmodule
