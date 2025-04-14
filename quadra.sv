//
// Quadratic polynomial:  f(x) = a + b*x2 + c*(x2^2)
//

`include "quadra.vh"

module quadra
(
    input x_t x,	//wejścia i wyjścia z quadra.vh
	 input dv_t x_dv,
	 output y_t y,
	 output dv_t y_dv
);

	 x2_t x2;	//z quadra.vh
    sq_t sq;
    a_t a;
    b_t b;
    c_t c;

    square square_n(
        .x2(x),
        .sq(x2)
    );

    lut lut_n(
        .x1(x[6:0]),
        .a(a),
        .b(b),
        .c(c)
    );

    always_comb begin	    // y = a + b * x2 + c * x2 * x2
        sq = x2 * x2;
        y = a + b * x2 + c * sq;
        y_dv = x_dv;
    end
   

endmodule
