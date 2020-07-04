module Pipeline_tb();

        reg clk;
	reg reset;

	PiplineRISCV uut (
		.clk(clk), 
		.reset(reset)
	);

	initial 
	begin
	reset=0;
	#3 reset=1;
	end
	
	initial begin
	clk=0;
	repeat(200)
	#5 clk=~clk;
	$finish;
	end
      
endmodule
