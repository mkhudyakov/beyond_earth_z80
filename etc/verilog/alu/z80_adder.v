module z80_adder (
    input  [7:0] a,
    input  [7:0] b,
    output [7:0] result,
    output       flag_c,
    output       flag_z,
    output       flag_s,
    output       flag_pv,
    output       flag_h,
    output       flag_n
);
    reg [7:0] sum;
    reg c;
    integer i;

    always @(*) begin
        c = 0;
        for (i = 0; i < 8; i = i + 1) begin
            sum[i] = a[i] ^ b[i] ^ c;
            c = (a[i] & b[i]) | (a[i] & c) | (b[i] & c);
        end
    end

    assign result = sum;
    assign flag_c = c;
    assign flag_z = (sum == 8'b0);
    assign flag_s = sum[7];
    assign flag_n = 0;
    assign flag_h = ((a[3] & b[3]) | (a[3] & ~sum[3]) | (b[3] & ~sum[3]));
    assign flag_pv = ~^sum;
endmodule