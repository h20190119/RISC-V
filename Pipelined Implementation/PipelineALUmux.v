module PipelineALUmux(input [31:0] immediate, input [31:0] reg_data2, input ctrl, input mem_write, output [31:0]alu_in2);

assign alu_in2=ctrl?immediate:reg_data2;
endmodule
