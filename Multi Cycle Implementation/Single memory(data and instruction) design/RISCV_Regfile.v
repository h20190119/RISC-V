module RISCV_Regfile#(
    parameter REG_WIDTH = 32,
    parameter REG_DEPTH = 32
    )(
    input Clk,
    input Rst,

    input [$clog2(REG_WIDTH) - 1:0] Addr1,
    input [$clog2(REG_WIDTH) - 1:0] Addr2,
    input [$clog2(REG_WIDTH) - 1:0] Addr3,

    output [REG_WIDTH - 1:0] RD1,
    output [REG_WIDTH - 1:0] RD2,
    
    input Regwrite,
    input [REG_WIDTH - 1:0] Inputs
    );
    reg [REG_WIDTH - 1:0] r_RD1;
    reg [REG_WIDTH - 1:0] r_RD2;
    assign RD1 = r_RD1;
    assign RD2 = r_RD2;

    //The registers, the first register is hard coded to 0
    reg [REG_WIDTH - 1:0] Registers[REG_DEPTH - 1:0];
 
   
    integer i;
    initial 
    begin
        for(i = 0; i < REG_DEPTH; i = i + 1)
        begin
            Registers[i] = i*10;
        end
    end

always @(posedge Clk) 
begin
         
r_RD1 <= (Addr1 == 32'b0)? 32'b0: Registers[Addr1];
r_RD2 <= (Addr2 == 32'b0)? 32'b0: Registers[Addr2];

if(Regwrite)
begin
     if(Addr3 != 0)
        begin
          Registers[Addr3] <= Inputs; 
        end
end
end
endmodule

