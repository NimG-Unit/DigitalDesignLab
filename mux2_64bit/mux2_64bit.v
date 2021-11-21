module mux2_1(o,x,y,selector);
    output o;
    input x,y,selector;
    not #(50) not1(nselector,selector);
    and #(50) and1(o1,x,nselector); 
    and #(50) and2(o2,y,selector);
    or #(50) or2(o,o1,o2);
endmodule

module testbench();

    reg  x, y;
    reg selector;
    wire o;

mux2_1 m(.o(o), .x(x), .selector(selector));    
//initilization
initial begin
    $dumpfile("mux2_64bit.vcd");
    $dumpvars(0, testbench);

    x = 0;
    y = 1;
    selector = 0;

end
always #4 selector = ~selector;

always #2 x = ~x;
always #2 y = ~y;


initial #128 $finish;


endmodule