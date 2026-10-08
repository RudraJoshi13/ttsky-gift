`default_nettype none
// GIFT-64 bit permutation PermBits (Banik et al., CHES 2017, Table 4):
// bit i of the input moves to bit P64(i) of the output. Pure wiring,
// no logic gates. One assign per row of Table 4, in the table's order.
module gift_perm (
    input  wire [63:0] x,
    output wire [63:0] y
);

  // Table 4, i = 0 to 15
  assign y[ 0] = x[ 0];
  assign y[17] = x[ 1];
  assign y[34] = x[ 2];
  assign y[51] = x[ 3];
  assign y[48] = x[ 4];
  assign y[ 1] = x[ 5];
  assign y[18] = x[ 6];
  assign y[35] = x[ 7];
  assign y[32] = x[ 8];
  assign y[49] = x[ 9];
  assign y[ 2] = x[10];
  assign y[19] = x[11];
  assign y[16] = x[12];
  assign y[33] = x[13];
  assign y[50] = x[14];
  assign y[ 3] = x[15];
  // Table 4, i = 16 to 31
  assign y[ 4] = x[16];
  assign y[21] = x[17];
  assign y[38] = x[18];
  assign y[55] = x[19];
  assign y[52] = x[20];
  assign y[ 5] = x[21];
  assign y[22] = x[22];
  assign y[39] = x[23];
  assign y[36] = x[24];
  assign y[53] = x[25];
  assign y[ 6] = x[26];
  assign y[23] = x[27];
  assign y[20] = x[28];
  assign y[37] = x[29];
  assign y[54] = x[30];
  assign y[ 7] = x[31];
  // Table 4, i = 32 to 47
  assign y[ 8] = x[32];
  assign y[25] = x[33];
  assign y[42] = x[34];
  assign y[59] = x[35];
  assign y[56] = x[36];
  assign y[ 9] = x[37];
  assign y[26] = x[38];
  assign y[43] = x[39];
  assign y[40] = x[40];
  assign y[57] = x[41];
  assign y[10] = x[42];
  assign y[27] = x[43];
  assign y[24] = x[44];
  assign y[41] = x[45];
  assign y[58] = x[46];
  assign y[11] = x[47];
  // Table 4, i = 48 to 63
  assign y[12] = x[48];
  assign y[29] = x[49];
  assign y[46] = x[50];
  assign y[63] = x[51];
  assign y[60] = x[52];
  assign y[13] = x[53];
  assign y[30] = x[54];
  assign y[47] = x[55];
  assign y[44] = x[56];
  assign y[61] = x[57];
  assign y[14] = x[58];
  assign y[31] = x[59];
  assign y[28] = x[60];
  assign y[45] = x[61];
  assign y[62] = x[62];
  assign y[15] = x[63];

endmodule
