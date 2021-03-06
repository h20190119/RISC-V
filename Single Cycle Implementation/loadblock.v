`timescale 1ns / 1ns

module loadblock(data,lb,lh,lw,lbu,lhu);

input [31:0] data;
output reg [31:0] lb,lh,lw,lbu,lhu;
always@(*)
begin

lb = {data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7:0]};
lh = {data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15:0]};
lw = data[31:0];
lbu = {24'b0,data[7:0]};
lhu = {16'b0,data[15:0]};

end
endmodule
