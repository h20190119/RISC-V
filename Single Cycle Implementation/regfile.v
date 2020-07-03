`timescale 1ns / 1ns
module regFile(clk,Ip1,sel_i1,Op1,sel_o1,Op2,sel_o2,reg_write,rst);      
input  [31:0]  Ip1; 
input  [4:0]  sel_i1,sel_o1,sel_o2; 

input reg_write; 
input rst,clk; 

output reg [31:0] Op1,Op2;        
reg [31:0] regFile [0:31]; 
integer i; 

initial
begin
for(i = 0; i < 32; i = i + 1)
begin
regFile[i] = i*10;
end
end

 
always@(posedge clk,Ip1,sel_i1,Op1,sel_o1,Op2,sel_o2) 
begin  

Op1 <= (sel_o1 == 32'b0)? 32'b0: regFile[sel_o1];
Op2 <= (sel_o2 == 32'b0)? 32'b0: regFile[sel_o2];


if (reg_write)
begin
if(sel_i1 != 0)
        begin
          regFile[sel_i1] <= Ip1; 
        end
end
end  
endmodule

