module RISCV_Mux2x1(
    input [31:0] d0,
    input [31:0] d1,
    input        sel,
    output[31:0] out);

    assign out = (sel == 1'b1) ? d1 : d0;
    
endmodule
