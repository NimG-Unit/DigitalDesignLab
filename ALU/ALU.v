module ALU( A, B, c_in, control_line, mode_select, out, c_out);

input [7:0] A, B;
input c_in;
input [2:0] control_line;
input mode_select;

output reg c_out;
output reg [7:0] out;

always@(*)
begin
    if(mode_select)
    begin
       case(control_line)
            3'd0 :  {c_out, out} = A + B + c_in;
            3'd1 :  {c_out, out} = A - B - c_in;
            3'd2 :  {c_out, out} = A + 1'b1;
            3'd3 :  {c_out, out} = B + 1'b1;
            3'd4 :  {c_out, out} = A - 1'b1;
            3'd5 :  {c_out, out} = B - 1'b1;
            3'd6 :  begin out = A; c_out = 0; end
            3'd7 :  begin out = B; c_out = 0; end
            default: out  = 8'd0;
       endcase
    end
    else
    begin
       c_out = 0; 
       case(control_line)
            3'd0 :  out = A & B;
            3'd1 :  out = A | B; 
            3'd2 :  out = A ^ B;
	    3'd3 :  out = ~ (A | B);
            3'd4 :  out = A << 2;
            3'd5 :  out = B << 2;
            3'd6 :  out = A >> 2;
            3'd7 :  out = B >> 2;
            default: out  = 8'd0;       
       endcase
    end
end

endmodule