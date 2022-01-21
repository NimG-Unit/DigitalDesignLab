`include "InstructionMemory.v"

module InstructionMemory_tb();
	reg [63:0] Address;
	wire [31:0] Instruction;
	
	InstructionMemory instruction_mem(Address, Instruction);
	initial begin
		Address = 10'b0001;
		#20 $display("First Test:\n%b\n", Instruction);
		Address = 10'b0010;
		#20 $display("Second Test:\n%b\n", Instruction);
		Address = 10'b0011;
		#20 $display("Third Test:\n%b\n", Instruction);
	end
endmodule
