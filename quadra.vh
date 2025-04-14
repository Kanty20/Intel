// quadra.vh

`ifndef QUADRA_VH
`define QUADRA_VH

typedef logic ck_t; // clock
typedef logic rs_t; // reset
typedef logic dv_t; // data valid

// --------------------------------------------------------------------------------
// I/O precision
// --------------------------------------------------------------------------------

// x in [0,2) -> u1.23
localparam int  X_I =  1;          //         =  1
localparam int  X_F = 23;          //         = 23
localparam int  X_W = X_I + X_F;   //  1 + 23 = 24 (u1.23)

typedef logic [X_W-1:0] x_t;		//zdefiniowany typ danych 

// y [-2,2) -> s2.23
localparam int  Y_I =  2;          //         =  2
localparam int  Y_F = 23;          //         = 23
localparam int  Y_W = X_I + X_F;   //  2 + 23 = 25 (s2.23)

typedef logic signed [Y_W-1:0] y_t;		//zdefiniowany typ danych

// --------------------------------------------------------------------------------
// Internal precision:

//localparam int X2_W = X_W + 1;		//square.sv nie działa, dlatego dodatkowo jeszcze tu dodaje definicje (??)
//localparam int SQ_W = 2 * X2_W;

//typedef logic [X2_W-1:0] x2_t;
//typedef logic [SQ_W-1:0] sq_t;


//localparam int Y_I_F = 4 + 2;    // czesc całkowita
//localparam int Y_F_F = 28 + 2;   // ułamkowa
//localparam int Y_W_F = Y_I_F + Y_F_F;

//typedef logic signed [Y_W_F-1:0] y_f_t;  // typ dla obl. pośrednich

typedef logic signed [31:0] a_t;  // s4.28
typedef logic signed [31:0] b_t;  // s4.28
typedef logic signed [31:0] c_t;  // s4.28

typedef logic signed [47:0] y_t;  // s2.46

typedef logic [16:0] x2_t;        // u0.17

// Kwadrat x2^2 wymaga więcej bitów: 17+17 = 34
typedef logic [33:0] sq_t;


`endif
