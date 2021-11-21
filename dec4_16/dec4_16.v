module decoder(x,e,d);
// x is the input for decoder
// e is enable
// d is the decoded ouptut

input  e;
input [3:0]x; 
output [15:0]d;
assign d[0]=  (~x[0]) & (~x[1]) &(~x[2]) & (~x[3]) & (e) ;
assign d[1]=  (~x[0]) & (~x[1]) &(~x[2]) & (x[3]) & (e) ;
assign d[2]=  (~x[0]) & (~x[1]) &(x[2]) & (~x[3]) & (e) ;
assign d[3]=  (~x[0]) & (~x[1]) &(x[2])  & (x[3]) & (e) ;
assign d[4]=  (~x[0]) & (x[1]) &(~x[2]) & (~x[3]) & (e) ;
assign d[5]=  (~x[0]) & (x[1]) &(~x[2])  & (x[3]) & (e) ;
assign d[6]=  (~x[0]) & (x[1]) &(x[2])  & (~x[3]) & (e) ;
assign d[7]=  (~x[0]) & (x[1]) &(x[2])  & (x[3]) & (e) ;

assign d[8]=  (x[0]) & (~x[1]) &(~x[2]) & (~x[3]) & (e) ;
assign d[9]=  (x[0]) & (~x[1]) &(~x[2]) & (x[3]) & (e) ;
assign d[10]= (x[0]) & (~x[1]) &(x[2]) & (~x[3]) & (e) ;
assign d[11]= (x[0]) & (~x[1]) &(x[2])  & (x[3]) & (e) ;
assign d[12]= (x[0]) & (x[1]) &(~x[2]) & (~x[3]) & (e) ;
assign d[13]= (x[0]) & (x[1]) &(~x[2])  & (x[3]) & (e) ;
assign d[14]= (x[0]) & (x[1]) &(x[2])  & (~x[3]) & (e) ;
assign d[15]= (x[0]) & (x[1]) &(x[2])  & (x[3]) & (e) ;

endmodule

module testbench();
reg [3:0]x;
reg e;
wire [15:0]d;

initial
begin

$dumpfile("dec4_16.vcd");
$dumpvars(0, testbench);

e=0;
x[0]=0;
x[1]=1;
x[2]=0;
x[3]=1;

#10 e=1;
#00 x[0]=0;
#00 x[1]=0;
#00 x[2]=0;
#00 x[3]=0;

#10 x[0]=0;
#00 x[1]=0;
#00 x[2]=1;
#00 x[3]=1;

#10 x[0]=0;
#00 x[1]=1;
#00 x[2]=0;
#00 x[3]=0;

#10 e=0;

end
decoder s(x,e,d);
endmodule