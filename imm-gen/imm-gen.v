module Immgen(instrcution, dataout);
    begin
    
    input [31:0] instruction;
    output [63:0] out;

    wire sign;
    assign wire = instrcution[31]; 
    
    wire [6:0] opcode;
    assign opcode = instruction[6:0];

    always @(instruction)
        case(opcode)
            7'b0000011: out <= { {31{sign}}, {22{sign}} instruction[30:20]};
            7'b0100011: out <= { {31{sign}}, {22{sign}} ,{instruction[30:25], instruction[11:7]};   
        endcase
    end