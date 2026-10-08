`default_nettype none
// GIFT round constant update (Banik et al., CHES 2017, Section 2): the
// 6-bit affine LFSR shared with SKINNY.
//   (c5, c4, c3, c2, c1, c0) <- (c4, c3, c2, c1, c0, c5 ^ c4 ^ 1)
// Starts at 0 and is updated before use, so round 1 uses 6'h01.
module gift_rc_update (
    input  wire [5:0] rc_in,
    output wire [5:0] rc_out
);

  assign rc_out = {rc_in[4:0], ~(rc_in[5] ^ rc_in[4])};

endmodule
