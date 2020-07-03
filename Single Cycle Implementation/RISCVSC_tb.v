`timescale 1ns / 1ns

module RISCVSC_tb();

reg clk,rst;
RISCVmain i_risc_v(.reset(rst),.clk(clk));
    
initial 
begin
clk = 1;
rst = 1;
#5;
rst = 0;
end
    
always
#4 clk = ~clk;
    
endmodule

