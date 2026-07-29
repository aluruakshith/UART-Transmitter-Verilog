module uart_tx(

    input clk,
    input rst,
    input baud_tick,
    input tx_start,
    input [7:0] tx_data,

    output reg tx,
    output reg tx_busy

);

parameter IDLE  = 2'b00;
parameter START = 2'b01;
parameter DATA  = 2'b10;
parameter STOP  = 2'b11;

reg [1:0] state;
reg [7:0] shift_reg;
reg [2:0] bit_count;

always @(posedge clk or posedge rst)
begin

    if(rst)
    begin
        state <= IDLE;
        tx <= 1'b1;
        tx_busy <= 1'b0;
        shift_reg <= 8'd0;
        bit_count <= 3'd0;
    end

    else
    begin

        case(state)

        IDLE:
        begin
            tx <= 1'b1;
            tx_busy <= 1'b0;

            if(tx_start)
            begin
                shift_reg <= tx_data;
                bit_count <= 3'd0;
                tx_busy <= 1'b1;
                state <= START;
            end
        end


        START:
        begin
            tx <= 1'b0;

            if(baud_tick)
                state <= DATA;
        end


        DATA:
        begin
            tx <= shift_reg[0];

            if(baud_tick)
            begin
                shift_reg <= shift_reg >> 1;

                if(bit_count == 3'd7)
                    state <= STOP;
                else
                    bit_count <= bit_count + 1'b1;
            end
        end


        STOP:
        begin
            tx <= 1'b1;

            if(baud_tick)
            begin
                tx_busy <= 1'b0;
                state <= IDLE;
            end
        end


        default:
        begin
            state <= IDLE;
        end

        endcase

    end

end

endmodule
