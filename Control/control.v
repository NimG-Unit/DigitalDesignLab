module control (op_code, alu_src, mem_to_reg , reg_write , mem_read , mem_write, branch , alu_op)
    
    input[6:0] op_code;
    output alu_src, mem_to_reg , reg_write , mem_read , mem_write, branch;
    output [1:0] alu_op;
    
    always@(op_code)
    begin
        assign {alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, alu_op[1] , alu_op[0]} = outputs;
        casex (op_code)
            7'b0000011: outputs  <= 8'b11110000;  // ld
            7'b0100011: outputs  <= 8'b1x001000;  // sd
            7'b1100011: outputs  <= 8'b0x000101;  // beq
            7'b0110011: outputs  <= 8'b00100010;  // R-Type
            default:    controls <= 8'bxxxxxxxx;  // illegal operation
        endcase
    end
