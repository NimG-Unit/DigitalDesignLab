`include "control.v"

module control_tb;

    reg[6:0] op_code;
    wire reg_dst , alu_src, mem_to_reg , reg_write , mem_read , mem_write, branch;
    wire [1:0] alu_op;

    control test_control ({op_code, reg_dst , alu_src, mem_to_reg , reg_write , mem_read , mem_write, branch , alu_op})

initial begin

    // result is 00100010
    op_code = 7'0110011
    $display("control: %d",  {alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, alu_op[1] , alu_op[0]})


    // result is 11110000
    op_code = 7'0000011
    $display("control: %d",  {alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, alu_op[1] , alu_op[0]})

    
end

always #10 clk = ~clk;

endmodule
