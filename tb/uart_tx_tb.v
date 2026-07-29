`timescale 1ns/1ps

module uart_tx_tb;

reg clk;
reg rst;
reg baud_tick;
reg tx_start;
reg [7:0] tx_data;

wire tx;
wire tx_busy;


// UART instance

uart_tx uut(
    .clk(clk),
    .rst(rst),
    .baud_tick(baud_tick),
    .tx_start(tx_start),
    .tx_data(tx_data),
    .tx(tx),
    .tx_busy(tx_busy)
);


// 50 MHz clock

initial begin
    clk = 0;
end

always #10 clk = ~clk;


// Baud tick for simulation
// one tick every 100 ns

initial begin
    baud_tick = 0;

    forever begin
        #100;
        baud_tick = 1;

        #20;
        baud_tick = 0;
    end
end



// Test sequence

initial begin

    rst = 1;
    tx_start = 0;
    tx_data = 8'b00000000;


    #40;
    rst = 0;


    #50;

    // Send ASCII A
    tx_data = 8'b01000001;

    tx_start = 1;

    #100;

    tx_start = 0;


    #2000;

    $finish;

end



// Waveform generation

initial begin
    $dumpfile("uart_tx.vcd");
    $dumpvars(0, uart_tx_tb);
end


endmodule
