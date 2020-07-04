module RISCV_flagstorage(input clk,input rst,input din,output dout);
    
reg dout_reg;
    
always @(posedge clk or posedge rst) 
begin
if(rst)
dout_reg <= 0;
else
dout_reg <= din;
end
    
assign dout = dout_reg;
    
endmodule
