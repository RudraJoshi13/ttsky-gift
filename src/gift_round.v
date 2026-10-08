`default_nettype none
// One GIFT-64 round (Banik et al., CHES 2017, Section 2), combinational:
//   1. SubCells:    the S-box GS on all 16 nibbles (16 instances).
//   2. PermBits:    bit i moves to bit P64(i) (wiring only).
//   3. AddRoundKey: U = k1 goes to bit 4n+1 and V = k0 to bit 4n of
//                   nibble n; round constant bits c5..c0 go to bits
//                   23, 19, 15, 11, 7, 3; bit 63 gets a 1.
module gift_round (
    input  wire [63:0] state_in,
    input  wire [31:0] round_key,  // {U, V} = {k1, k0}
    input  wire [5:0]  rc,         // round constant c5..c0
    output wire [63:0] state_out
);

  // 1. SubCells
  wire [63:0] sub;
  genvar n;
  generate
    for (n = 0; n < 16; n = n + 1) begin : g_sbox
      gift_sbox u_sbox (.x(state_in[4*n+3:4*n]), .y(sub[4*n+3:4*n]));
    end
  endgenerate

  // 2. PermBits
  wire [63:0] perm;
  gift_perm u_perm (.x(sub), .y(perm));

  // 3. AddRoundKey: key bits only in the two lowest bits of each nibble
  wire [15:0] u = round_key[31:16];
  wire [15:0] v = round_key[15:0];
  wire [63:0] key_bits;
  generate
    for (n = 0; n < 16; n = n + 1) begin : g_key
      assign key_bits[4*n+3] = 1'b0;
      assign key_bits[4*n+2] = 1'b0;
      assign key_bits[4*n+1] = u[n];
      assign key_bits[4*n]   = v[n];
    end
  endgenerate

  //                   bit 63, 62..24, bit 23, 22..20, bit 19, 18..16, bit 15,
  //                   14..12, bit 11, 10..8, bit 7, 6..4, bit 3, 2..0
  wire [63:0] rc_bits = {1'b1, 39'b0, rc[5], 3'b0, rc[4], 3'b0, rc[3], 3'b0,
                         rc[2], 3'b0, rc[1], 3'b0, rc[0], 3'b0};

  assign state_out = perm ^ key_bits ^ rc_bits;

endmodule
