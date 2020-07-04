module RISCV_storagereg(input clk,input rst,input  [31:0] din,output [31:0] dout);
    
reg [31:0] dout_reg;
    
always @(posedge clk or posedge rst or din) 
begin
if(rst)
dout_reg <= 0;
else
dout_reg <= din;
end
    
assign dout = dout_reg;
    
endmodule
