`default_nettype none
`timescale 1ns / 1ps
// Block 3 test: gift_round against the golden model.
// sim/vectors/round.hex (python3 sim/gen_vectors.py) has 148 lines of
// state_in | round_key | round constant | state_out:
// lines 0 to 83 are rounds 0 to 27 of the 3 official vectors, then 64 random.
// Run from the repository root.
module tb_gift_round;

  reg  [63:0]  state_in;
  reg  [31:0]  round_key;
  reg  [5:0]   rc;
  wire [63:0]  state_out;
  reg  [167:0] vec [0:147];
  integer i;
  integer errors;

  gift_round dut (.state_in(state_in), .round_key(round_key), .rc(rc), .state_out(state_out));

  initial begin
    $readmemh("sim/vectors/round.hex", vec);
    errors = 0;
    for (i = 0; i < 148; i = i + 1) begin
      state_in  = vec[i][167:104];
      round_key = vec[i][103:72];
      rc        = vec[i][69:64];
      #1;
      if (state_out !== vec[i][63:0]) begin
        errors = errors + 1;
        if (i < 84)
          $display("vector %0d round %0d: got %h expected %h  MISMATCH", i / 28 + 1, i % 28, state_out, vec[i][63:0]);
        else
          $display("random line %0d: got %h expected %h  MISMATCH", i - 84, state_out, vec[i][63:0]);
      end
    end
    $display("official-vector rounds checked: 84, random rounds checked: 64");
    if (errors == 0)
      $display("PASS: all 148 rounds match the model");
    else
      $display("FAIL: %0d of 148 rounds differ from the model", errors);
    $finish;
  end

endmodule
