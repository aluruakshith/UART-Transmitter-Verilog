module baud_gen #(
    parameter CLOCK_FREQ = 50000000,
    parameter BAUD_RATE  = 9600
)(
    input clk,
    input rst,
    output reg baud_tick
);

localparam DIVISOR = CLOCK_FREQ / BAUD_RATE;

reg [15:0] count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 16'd0;
        baud_tick <= 1'b0;
    end
    else begin
        if (count == DIVISOR-1) begin
            count <= 16'd0;
            baud_tick <= 1'b1;
        end
        else begin
            count <= count + 1'b1;
            baud_tick <= 1'b0;
        end
    end
end

endmodule
