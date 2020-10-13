`define DELAY 24'd12_000_000 // 0.5s delay

module led (
    input sys_clk, // 24MHz clk input
    input sys_rst_n, // reset input
    output reg [2:0] led // 110 G, 101 R, 011 B
    );

    reg [33:0] counter;

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n)
            counter <= 24'd0;
        else if (counter < `DELAY)
            counter <= counter + 1;
        else
            counter <= 24'd0;
    end

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n)
            led <= 3'b110;
        else if (counter == `DELAY)
            led[2:0] <= {led[1:0], led[2]};
        else
            led <= led;
    end
endmodule
