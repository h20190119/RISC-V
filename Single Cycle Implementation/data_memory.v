`timescale 1ns / 1ns

module data_memory(input dm_read,input dm_write,input[31:0] addr,input[31:0] wdata,output reg [31:0] rdata);

reg [31:0] memdata[1023:0];
wire [1:0] c;

assign c = {dm_read,dm_write};
integer i;

initial 
begin       
for(i = 0; i < 1024; i = i + 1)
begin
memdata[i] = i*10;
end        
end

always @(c,addr,wdata) 
begin
if(c==2'b10)
begin
rdata = memdata[addr];
end
else if(c== 2'b01)
begin
memdata[addr] = wdata;
end
else
begin
rdata = 32'h00000000;
end
end
endmodule
