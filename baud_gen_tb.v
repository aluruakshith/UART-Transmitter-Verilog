`timescale 1ns/1ps

module baud_gen_tb;

reg clk;
reg rst;
wire baud_tick;

baud_gen #(
    .CLOCK_FREQ(50000000),
    .BAUD_RATE(9600)
) uut (
    .clk(clk),
    .rst(rst),
    .baud_tick(baud_tick)
);
initial begin
    clk = 0;
end

always #10 clk = ~clk;

initial begin
    rst = 1;

    #40;
    rst = 0;

    #200000;
    $finish;
end

initial begin
    $dumpfile("baud_gen.vcd");
    $dumpvars(0, baud_gen_tb);
end

endmodule
