module RISCV_EXTDM(
    input [31:0] dmout,
    input [2:0]  DMEXTop,  
    output reg [31:0] DMout

    );

parameter DMEXT_LB = 0;
parameter DMEXT_LH = 1;
parameter DMEXT_LW = 2; 
parameter DMEXT_LBU = 3;
parameter DMEXT_LHU = 4;
 
    always @(*) 
    begin
        case(DMEXTop)
            DMEXT_LB  : DMout = {{ 24{dmout[7]} },dmout[7:0]};
            DMEXT_LH  : DMout = {{ 16{dmout[15]} },dmout[15:0]};
            DMEXT_LW  : DMout = dmout;
            DMEXT_LBU : DMout = {24'b0,dmout[7:0]};
            DMEXT_LHU : DMout = {16'b0,dmout[15:0]};         
        endcase
    end
    
endmodule
