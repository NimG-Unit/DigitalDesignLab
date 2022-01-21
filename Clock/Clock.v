module clockGenerator(Clock);
	output reg Clock;
	initial begin
		Clock = 0;
		forever #5 Clock = ~Clock;
	end
endmodule