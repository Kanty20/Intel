`include "quadra.vh"

module quadra_top
(
    input  ck_t clk,
    input  rs_t rst_b,
    input  x_t  x,
    input  dv_t x_dv,
    output y_t  y,
    output dv_t y_dv
);
    // Pipeline data valid (3 stages):
    dv_t dv_p0, dv_p1, dv_p2;

    always_ff @(posedge clk)
    if (!rst_b) begin
        dv_p0 <= '0;
        dv_p1 <= '0;
        dv_p2 <= '0;
    end
    else begin
        dv_p0 <= x_dv;
        dv_p1 <= dv_p0;
        dv_p2 <= dv_p1;
    end

    // <challenge!>
	 //trzeba dodać lut i square_i bo nie ma 
	 
	 square square(
		.x2(x_d2[X2_W-1:0]),
		.sq(sq)
	 );
	 
	 lut lut(
        .x1(x[6:0]),
        .a(a),
        .b(b),
        .c(c)
    );

    // Outputs:
    always_comb y_dv = dv_p2;
    always_comb y    = '0;

endmodule
