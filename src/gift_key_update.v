`default_nettype none
// GIFT key state update (Banik et al., CHES 2017, Section 2, key schedule).
// The 128-bit key state is eight 16-bit words k7..k0 (k0 = bits 15..0).
// After each round:  k7..k0 <- (k1 >>> 2) | (k0 >>> 12) | k7 | k6 | ... | k2
// where >>> is a rotation right within the 16-bit word. Wiring only.
module gift_key_update (
    input  wire [127:0] key_in,
    output wire [127:0] key_out
);

  wire [15:0] k1 = key_in[31:16];
  wire [15:0] k0 = key_in[15:0];

  assign key_out = {
      {k1[1:0],  k1[15:2]},   // new k7 = k1 >>> 2
      {k0[11:0], k0[15:12]},  // new k6 = k0 >>> 12
      key_in[127:32]          // new k5..k0 = old k7..k2
  };

endmodule
