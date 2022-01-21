
`include "Adder64Bit.v"

module Adder64Bit_tb;

 reg [63:0] input1;
 reg [63:0] input2;
 wire [63:0] sum;

 
 Adder64Bit uut (
  .input1(input1), 
  .input2(input2), 
  .answer(sum)
 );

 initial begin
   $dumpfile("Adder64Bit.vcd");
   $dumpvars(0,Adder64Bit_tb);
   
  input1 = 1209;
  input2 = 4565;
  #100;
  
 end
      
endmodule