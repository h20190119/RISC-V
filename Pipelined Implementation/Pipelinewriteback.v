module Pipelinewriteback(input [31:0] alu_out, input [31:0] memory_read, input ctrl, output [31:0] writetoreg);

assign writetoreg=ctrl?alu_out:memory_read;
endmodule
