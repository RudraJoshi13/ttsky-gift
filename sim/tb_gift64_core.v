`default_nettype none
`timescale 1ns / 1ps
// Block 5 test: the clocked core gift64_core against the golden model.
// Vector files from python3 sim/gen_vectors.py. Run from the repository root.
//   1. Official vectors: state and key after every edge E0..E32 vs the trace,
//      plus busy/done timing, ciphertext, key restored.
//   2. 64 random vectors: ciphertext and key restored.
//   3. Back to back: same key, new plaintext only, 4 pairs.
//   4. While busy: writes and a second start change nothing.
//   5. A state write after done clears done.
module tb_gift64_core;

  reg          clk = 1'b0;
  reg          rst_n = 1'b0;
  reg          wr_en = 1'b0;
  reg  [4:0]   wr_addr = 5'd0;
  reg  [7:0]   wr_data = 8'd0;
  reg          start = 1'b0;
  wire [63:0]  state;
  wire [127:0] key;
  wire         busy, done;

  gift64_core dut (.clk(clk), .rst_n(rst_n), .wr_en(wr_en), .wr_addr(wr_addr),
                   .wr_data(wr_data), .start(start), .state(state), .key(key),
                   .busy(busy), .done(done));

  always #10 clk = ~clk;  // 50 MHz

  reg [191:0] trace [0:98];    // 3 vectors x 33 edges
  reg [255:0] vecs  [0:66];    // pt | key | ct
  reg [383:0] b2b   [0:3];     // key | pt1 | ct1 | pt2 | ct2
  integer errors = 0;
  integer v, e, i;

  // Inputs change on the falling edge; outputs are checked after the rising edge.
  task write_byte(input [4:0] a, input [7:0] d);
    begin
      @(negedge clk); wr_en = 1'b1; wr_addr = a; wr_data = d;
      @(negedge clk); wr_en = 1'b0;
    end
  endtask

  task write_key(input [127:0] k);
    begin
      for (i = 0; i < 16; i = i + 1) write_byte(i[4:0], k[127 - 8*i -: 8]);
    end
  endtask

  task write_pt(input [63:0] p);
    begin
      for (i = 0; i < 8; i = i + 1) write_byte(5'h10 + i[4:0], p[63 - 8*i -: 8]);
    end
  endtask

  task pulse_start;  // start high for exactly one rising edge (E0)
    begin
      @(negedge clk); start = 1'b1;
      @(negedge clk); start = 1'b0;
    end
  endtask

  task wait_done;
    begin
      i = 0;
      while (!done && i < 100) begin @(posedge clk); #1; i = i + 1; end
      if (!done) begin errors = errors + 1; $display("timeout waiting for done"); end
    end
  endtask

  task check(input cond, input [8*48-1:0] what);
    begin
      if (!cond) begin errors = errors + 1; $display("FAIL: %0s", what); end
    end
  endtask

  initial begin
    $readmemh("sim/vectors/core_trace.hex", trace);
    $readmemh("sim/vectors/core_vectors.hex", vecs);
    $readmemh("sim/vectors/core_b2b.hex", b2b);
    repeat (3) @(negedge clk);
    rst_n = 1'b1;
    check(busy === 1'b0 && done === 1'b0, "busy/done not 0 after reset");

    // 1. Official vectors, edge by edge
    for (v = 0; v < 3; v = v + 1) begin
      write_key(vecs[v][191:64]);
      write_pt(vecs[v][255:192]);
      @(negedge clk); start = 1'b1;
      for (e = 0; e <= 32; e = e + 1) begin
        @(posedge clk); #1;
        if (e == 0) start = 1'b0;
        if ({state, key} !== trace[33*v + e]) begin
          errors = errors + 1;
          $display("vector %0d after E%0d: state %h key %h, expected %h %h", v + 1, e,
                   state, key, trace[33*v + e][191:128], trace[33*v + e][127:0]);
        end
        if (busy !== (e < 32) || done !== (e == 32)) begin
          errors = errors + 1;
          $display("vector %0d after E%0d: busy=%b done=%b, expected busy=%b done=%b",
                   v + 1, e, busy, done, e < 32, e == 32);
        end
      end
      check(state === vecs[v][63:0], "official ciphertext");
      check(key === vecs[v][191:64], "key not restored (official)");
      $display("official vector %0d: ciphertext %h, key restored, 33 edges checked", v + 1, state);
    end

    // 2. Random vectors
    for (v = 3; v < 67; v = v + 1) begin
      write_key(vecs[v][191:64]);
      write_pt(vecs[v][255:192]);
      pulse_start;
      wait_done;
      if (state !== vecs[v][63:0] || key !== vecs[v][191:64]) begin
        errors = errors + 1;
        $display("random vector %0d: ct %h expected %h, key restored=%b", v - 3, state,
                 vecs[v][63:0], key === vecs[v][191:64]);
      end
    end
    $display("random vectors checked: 64");

    // 3. Back to back with the same key: only the plaintext is rewritten
    for (v = 0; v < 4; v = v + 1) begin
      write_key(b2b[v][383:256]);
      write_pt(b2b[v][255:192]);
      pulse_start; wait_done;
      check(state === b2b[v][191:128], "back-to-back first block");
      write_pt(b2b[v][127:64]);
      check(done === 1'b0, "state write did not clear done");
      pulse_start; wait_done;
      check(state === b2b[v][63:0], "back-to-back second block (key not rewritten)");
    end
    $display("back-to-back pairs checked: 4 (key written once per pair)");

    // 4. While busy: writes and a second start are ignored
    write_key(vecs[2][191:64]);
    write_pt(vecs[2][255:192]);
    pulse_start;                                   // E0 happens inside pulse_start
    repeat (5) @(negedge clk);                     // now between E5 and E6
    wr_en = 1'b1; wr_addr = 5'h00; wr_data = 8'hFF;  // key byte write while busy
    @(negedge clk); wr_addr = 5'h10;                  // state byte write while busy
    @(negedge clk); wr_en = 1'b0; start = 1'b1;       // second start while busy
    @(negedge clk); start = 1'b0;                  // now between E8 and E9
    e = 0;
    while (!done && e < 100) begin @(posedge clk); #1; e = e + 1; end
    check(e == 24, "done not at E32 after writes/start while busy");
    check(state === vecs[2][63:0], "ciphertext changed by writes while busy");
    check(key === vecs[2][191:64], "key changed by writes while busy");
    $display("writes and start while busy: ignored (done after %0d more edges: E9 to E32 = 24)", e);

    if (errors == 0) $display("PASS: core matches the model on every check");
    else             $display("FAIL: %0d errors", errors);
    $finish;
  end

endmodule
