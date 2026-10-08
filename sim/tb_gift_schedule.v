`default_nettype none
`timescale 1ns / 1ps
// Block 4 test: gift_key_update and gift_rc_update against the golden model.
//   sim/vectors/key.hex: 84 key updates from the 3 official vectors, 64 random.
//   sim/vectors/rc.hex:  all 64 possible round constant inputs.
// Also runs the constant LFSR from 0 for 28 rounds and checks the sequence
// against the paper's table (01, 03, 07, ... 0B). Run from the repository root.
module tb_gift_schedule;

  reg  [127:0] key_in;
  wire [127:0] key_out;
  reg  [5:0]   rc_in;
  wire [5:0]   rc_out;
  reg  [255:0] kvec [0:147];
  reg  [15:0]  cvec [0:63];
  reg  [5:0]   paper [0:27];
  reg  [5:0]   rc;
  integer i;
  integer kerr, cerr, serr;

  gift_key_update u_key (.key_in(key_in), .key_out(key_out));
  gift_rc_update  u_rc  (.rc_in(rc_in), .rc_out(rc_out));

  initial begin
    $readmemh("sim/vectors/key.hex", kvec);
    $readmemh("sim/vectors/rc.hex", cvec);
    // Round constants for rounds 1 to 28, copied from the paper's table.
    paper[0]  = 6'h01; paper[1]  = 6'h03; paper[2]  = 6'h07; paper[3]  = 6'h0F;
    paper[4]  = 6'h1F; paper[5]  = 6'h3E; paper[6]  = 6'h3D; paper[7]  = 6'h3B;
    paper[8]  = 6'h37; paper[9]  = 6'h2F; paper[10] = 6'h1E; paper[11] = 6'h3C;
    paper[12] = 6'h39; paper[13] = 6'h33; paper[14] = 6'h27; paper[15] = 6'h0E;
    paper[16] = 6'h1D; paper[17] = 6'h3A; paper[18] = 6'h35; paper[19] = 6'h2B;
    paper[20] = 6'h16; paper[21] = 6'h2C; paper[22] = 6'h18; paper[23] = 6'h30;
    paper[24] = 6'h21; paper[25] = 6'h02; paper[26] = 6'h05; paper[27] = 6'h0B;
    kerr = 0; cerr = 0; serr = 0;

    for (i = 0; i < 148; i = i + 1) begin
      key_in = kvec[i][255:128];
      #1;
      if (key_out !== kvec[i][127:0]) begin
        kerr = kerr + 1;
        $display("key line %0d: got %h expected %h  MISMATCH", i, key_out, kvec[i][127:0]);
      end
    end

    for (i = 0; i < 64; i = i + 1) begin
      rc_in = cvec[i][13:8];
      #1;
      if (rc_out !== cvec[i][5:0]) begin
        cerr = cerr + 1;
        $display("constant in=%h: got %h expected %h  MISMATCH", rc_in, rc_out, cvec[i][5:0]);
      end
    end

    rc = 6'h00;
    for (i = 0; i < 28; i = i + 1) begin
      rc_in = rc;
      #1;
      rc = rc_out;
      if (rc !== paper[i]) begin
        serr = serr + 1;
        $display("round %0d constant: got %h, paper table says %h  MISMATCH", i + 1, rc, paper[i]);
      end
    end

    $display("key updates: %0d of 148 wrong; constant inputs: %0d of 64 wrong; 28-round sequence: %0d of 28 wrong",
             kerr, cerr, serr);
    if (kerr == 0 && cerr == 0 && serr == 0)
      $display("PASS: key update and round constant match the model and the paper");
    else
      $display("FAIL");
    $finish;
  end

endmodule
