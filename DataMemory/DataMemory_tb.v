`include "DataMemory.v"

module DataMemory_tb;
    wire clk;
    reg [47:0] address;
    reg memWrite, memRead;
    reg [63:0] writeData;
    wire [63:0] readData;
    integer i;

    clockGenerator clock (clk);
    DataMemory DataMemory_instance (clk, memWrite, memRead, address , writeData , readData);

    initial begin
        $dumpfile("DataMemory_tb.vcd");
        $dumpvars(0, DataMemory_tb);

        memWrite <= 0;
        memRead <= 0;

        i = 0;
        while(i <= 15) begin
            @(posedge clk); address <= i*5;
            i = i+1;
        end

        #10 memWrite <= 1;
        i = 0;
        while(i <= 15) begin
            @(posedge clk); address <= i*5; writeData <= i+1;
            i = i+1;
        end

        #10 memWrite <= 0; memRead <= 1;
        i = 0;
        while(i <= 15) begin
            @(posedge clk); address <= i*5;
            i = i+1;
        end
        
        #10 $finish;
    end
endmodule
