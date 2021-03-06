`timescale 1ns / 1ns

module storeblock(data,sb,sh,sw);

input [31:0] data;
output reg [31:0] sb,sh,sw;

always@(*)
begin

sb = {data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7],data[7:0]};
sh = {data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15],data[15:0]};
sw = data[31:0];


end
endmodule
