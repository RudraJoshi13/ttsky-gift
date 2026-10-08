`default_nettype none
// GIFT 4-bit S-box GS (Banik et al., "GIFT: A Small Present", CHES 2017,
// Table 3). Pure combinational logic. The round-based core uses one
// instance per nibble (16 in total), as in the paper's round-based
// implementation, where the whole S-box layer is applied in one clock.
//
// Table 3:  x     = 0 1 2 3 4 5 6 7 8 9 A B C D E F
//           GS(x) = 1 A 4 C 6 F 3 9 2 D B 7 5 0 8 E
//
// Written as one 64-bit constant (entry x is bits 4x+3..4x) rather than a
// case statement: Yosys turns a case table into a ROM and then copies the
// state flip-flops that feed it into the ROM, which costs 64 extra
// flip-flops in the core (seen in synthesis; LibreLane runs the same passes).
module gift_sbox (
    input  wire [3:0] x,
    output wire [3:0] y
);

  //                       x = F     E     D     C     B     A     9     8
  //                           7     6     5     4     3     2     1     0
  localparam [63:0] GS = {4'hE, 4'h8, 4'h0, 4'h5, 4'h7, 4'hB, 4'hD, 4'h2,
                          4'h9, 4'h3, 4'hF, 4'h6, 4'hC, 4'h4, 4'hA, 4'h1};

  assign y = GS[4*x +: 4];

endmodule
