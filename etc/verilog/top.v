module top(
    input clk,
    input uart_rx_i,
    output uart_tx_o,
    output reg LED
);
    wire [7:0] rx_data;
    wire rx_ready;
    reg tx_start = 0;
    reg [7:0] tx_data;
    wire tx_busy;

    // Blink control
    reg [23:0] blink_timer = 0;
    reg blink = 0;

    // TX FSM
    reg sending = 0;
    reg [7:0] next_tx_data = 0;
    reg stage = 0;

    // RX FSM
    reg [7:0] opcode = 0;
    reg [7:0] operand = 0;
    reg rx_state = 0;
    reg evaluate = 0;

    localparam [7:0] ADD_CONST = 8'd42;
    localparam [7:0] UNKNOWN_OPCODE = 8'hFF;

    // ALU outputs
    wire [7:0] sum;
    wire flag_c, flag_z, flag_s, flag_pv, flag_h, flag_n;

    z80_adder alu (
        .a(ADD_CONST),
        .b(operand),
        .result(sum),
        .flag_c(flag_c),
        .flag_z(flag_z),
        .flag_s(flag_s),
        .flag_pv(flag_pv),
        .flag_h(flag_h),
        .flag_n(flag_n)
    );

    wire [7:0] flags = {flag_s, flag_z, 1'b0, flag_h, 1'b0, flag_pv, flag_n, flag_c};

    uart_rx #(.CLK_FREQ(12_000_000), .BAUD(9600)) uart_rx_inst (
        .clk(clk),
        .rst(1'b0),
        .rx(uart_rx_i),
        .data_out(rx_data),
        .data_ready(rx_ready)
    );

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

        // UART RX 2-byte command
        if (rx_ready && !sending && !evaluate) begin
            if (rx_state == 0) begin
                opcode <= rx_data;
                rx_state <= 1;
            end else begin
                operand <= rx_data;
                rx_state <= 0;
                evaluate <= 1; // wait one cycle before reading ALU output
            end
        end

        // ALU evaluation (1 cycle after operand is latched)
        if (evaluate) begin
            evaluate <= 0;

            if (opcode[7:3] == 5'b10000) begin // check for ADD A, r family
                tx_data <= sum;
                next_tx_data <= flags;
            end else begin
                tx_data <= UNKNOWN_OPCODE;
                next_tx_data <= 8'h00;
            end

            tx_start <= 1;
            sending <= 1;
            stage <= 0;
            blink <= 1;
            blink_timer <= 0;
        end

        // UART TX 2-byte response
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