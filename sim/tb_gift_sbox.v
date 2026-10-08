`default_nettype none
`timescale 1ns / 1ps
// Block 1 test: all 16 inputs of gift_sbox against the golden model.
// Expected values come from sim/vectors/sbox.hex (python3 sim/gen_vectors.py).
// Run from the repository root.
module tb_gift_sbox;

  reg  [3:0] x;
  wire [3:0] y;
  reg  [3:0] expected [0:15];
  integer i;
  integer errors;

  gift_sbox dut (.x(x), .y(y));

  initial begin
    $readmemh("sim/vectors/sbox.hex", expected);
    errors = 0;
    for (i = 0; i < 16; i = i + 1) begin
      x = i[3:0];
      #1;
      if (y !== expected[i]) begin
        errors = errors + 1;
        $display("x=%h y=%h expected=%h  MISMATCH", x, y, expected[i]);
      end else begin
        $display("x=%h y=%h ok", x, y);
      end
    end
    if (errors == 0)
      $display("PASS: all 16 S-box inputs match the model");
    else
      $display("FAIL: %0d of 16 S-box inputs differ from the model", errors);
    $finish;
  end

endmodule
