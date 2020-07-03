module RISCV_tb();
    
reg clk,rst;
RISCV_datapath i_risc_v(.clk(clk), .rst(rst));
    
initial 
begin
clk = 1;
rst = 1;
#5;
rst = 0;
end
    
always
#1 clk = ~clk;
    
endmodule
