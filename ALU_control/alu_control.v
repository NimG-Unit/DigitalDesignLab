module alu_control (alu_operation, func7 , func3, control)
    
    # operation ID
    reg[3:0] subtrack = 4'b0110;
    reg[3:0] add       = 4'b0010;
    reg[3:0] AND       = 4'b0000;
    reg[3:0] OR        = 4'b0001;

    input[1:0] alu_operation;
    input[6:0] func7;
    input[2:0] func3;
    output[3:0] control;

    
    @always(alu_operation or func7 or fun)
    begin
    case (alu_operation)
        2'b00: control <= add;
        2'b01: control <= subtrack;
        2'b10: begin
            case(func3)
                3'b000 : begin
                    case (func7)
                        7'b0000000: control <= add;
                        7'b0100000: control <= subtrack;
                    endcase
                end
                3'b111 : control <= AND;
                3'b110 : control <= OR;
            endcase
        end
    endcase
    end
    
endmodule
