`timescale 1ns/1ps

module testbench;

    reg clk = 0;
    reg [23:0] x;
    wire [23:0] y;

    // instancja DUT
    wejscia dut (
        .clk(clk),
        .x(x),
        .y(y)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Start symulacji");

        x = 24'd8388608; // 1.0
        #10;
        $display("x = %d, y = %d", x, y);

        x = 24'd4194304; // 0.5
        #10;
        $display("x = %d, y = %d", x, y);

        x = 24'd0;
        #10;
        $display("x = %d, y = %d", x, y);

        $finish;
    end

endmodule
