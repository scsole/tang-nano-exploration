module blinky_top (
    input  wire reset,
    output wire [2:0] gpio,
    input wire fpga_rx,
    output wire fpga_tx
);

    logic clk;
    OSCH #(
        .FREQ_DIV(125) // 250[MHz] / FREQ_DIV = output
    ) osc_inst (
        .OSCOUT(clk)
    );

    localparam int COUNTER_TOP = 32'd2_000_000 - 32'd1;

    assign fpga_tx = fpga_rx;

    logic [2:0] gpio_out;
    assign gpio = ~gpio_out[2:0];

    logic [31:0] counter;

    always_ff @(posedge clk) begin
        if( !reset ) begin
            gpio_out <= 0;
            counter <= 0;
        end else begin
            if( counter == COUNTER_TOP ) begin
                counter <= 0;
                gpio_out <= ~gpio_out;
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule
