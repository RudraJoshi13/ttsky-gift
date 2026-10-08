`default_nettype none
`timescale 1ns / 1ps
// Block 2 test: gift_perm against the golden model.
// sim/vectors/perm.hex (python3 sim/gen_vectors.py) has 128 lines of
// "input output": 64 inputs with a single 1 in bit i (one line per wire),
// then 64 random inputs. Run from the repository root.
module tb_gift_perm;

  reg  [63:0] x;
  wire [63:0] y;
  reg  [63:0] vec [0:255];  // input, output, input, output, ...
  integer i;
  integer errors;

  gift_perm dut (.x(x), .y(y));

  initial begin
    $readmemh("sim/vectors/perm.hex", vec);
    errors = 0;
    for (i = 0; i < 128; i = i + 1) begin
      x = vec[2 * i];
      #1;
      if (y !== vec[2 * i + 1]) begin
        errors = errors + 1;
        $display("line %0d: x=%h y=%h expected=%h  MISMATCH", i, x, y, vec[2 * i + 1]);
      end
    end
    $display("single-bit lines checked: 64, random lines checked: 64");
    if (errors == 0)
      $display("PASS: all 128 permutation vectors match the model");
    else
      $display("FAIL: %0d of 128 permutation vectors differ from the model", errors);
    $finish;
  end

endmodule
