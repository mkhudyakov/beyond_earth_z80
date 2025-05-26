module top(input clk,             // 12 MHz clock
           input uart_rx_i,       // UART RX input
           output uart_tx_o,      // UART TX output
           output reg LED);       // Blinks on valid RX

    wire [7:0] rx_data;
    wire rx_ready;
    reg tx_start = 0;
    reg [7:0] tx_data;
    wire tx_busy;

    // Blink control
    reg [23:0] blink_timer = 0;
    reg blink = 0;

    // TX state latch
    reg sending = 0;
    reg [7:0] next_tx_data = 0;
    reg stage = 0;

    localparam [7:0] ADD_CONST = 8'd42;  // Example constant

    // ALU outputs
    wire [7:0] sum;
    wire flag_c, flag_z, flag_s, flag_pv, flag_h, flag_n;

    // Instantiate RX (oversampled)
    uart_rx #(.CLK_FREQ(12_000_000), .BAUD(9600)) uart_rx_inst (
        .clk(clk),
        .rst(1'b0),
        .rx(uart_rx_i),
        .data_out(rx_data),
        .data_ready(rx_ready)
    );

    z80_adder alu (
        .a(rx_data),
        .b(ADD_CONST),
        .result(sum),
        .flag_c(flag_c),
        .flag_z(flag_z),
        .flag_s(flag_s),
        .flag_pv(flag_pv),
        .flag_h(flag_h),
        .flag_n(flag_n)
    );

    wire [7:0] flags = {flag_s, flag_z, 1'b0, flag_h, 1'b0, flag_pv, flag_n, flag_c};

    // Instantiate TX (standard FSM)
    uart_tx #(.CLKS_PER_BIT(1250)) uart_tx_inst (
        .clk(clk),
        .rst(1'b0),
        .tx_start(tx_start),
        .data_in(tx_data),
        .tx(uart_tx_o),
        .busy(tx_busy)
    );

    always @(posedge clk) begin
        tx_start <= 0;

        if (rx_ready && !sending) begin
            tx_data <= sum;
            next_tx_data <= flags;

            tx_start <= 1;
            sending <= 1;
            stage <= 0;

            // Blink LED briefly
            blink <= 1;
            blink_timer <= 0;
        end

        if (sending && !tx_busy && !tx_start) begin
            if (stage == 0) begin
                tx_data <= next_tx_data;
                tx_start <= 1;
                stage <= 1;
            end else begin
                sending <= 0;
            end
        end

        if (blink) begin
            blink_timer <= blink_timer + 1;
            if (blink_timer > 1_000_000)
                blink <= 0;
        end

        LED <= blink;
    end

endmodule