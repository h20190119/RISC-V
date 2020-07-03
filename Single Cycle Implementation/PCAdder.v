`timescale 1ns / 1ns

module PCAdder(PCResult,PCAddResult);

input   [31:0]  PCResult;
output reg [31:0]  PCAddResult;

   
always @(*)
begin
PCAddResult = PCResult + 32'h00000004;
end
endmodule
