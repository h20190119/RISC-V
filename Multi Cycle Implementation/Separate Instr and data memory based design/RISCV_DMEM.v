module RISCV_DMEM(WRbe,DMwr,addr,WriteData,ReadData,clk);

input DMwr,clk;
input [3:0] WRbe;
input [31:0] addr;
input [31:0] WriteData;
output reg [31:0] ReadData;
reg [31:0] dmem [0:1023];
integer i;
   
initial
begin
for (i=0; i<1024; i=i+1)   
dmem[i]=i*10; 
end
	
always @(posedge clk) 
begin
ReadData = dmem[addr];

if(DMwr)

if(WRbe[0]) dmem[addr][7:0] <= WriteData[7:0];
if(WRbe[1]) dmem[addr][15:8] <= WriteData[15:8];
if(WRbe[2]) dmem[addr][23:16] <= WriteData[23:16];
if(WRbe[3]) dmem[addr][31:24] <= WriteData[31:24];
end	
endmodule

