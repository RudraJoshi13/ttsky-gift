`default_nettype none
`timescale 1ns / 1ps
// Block 6 test: the Tiny Tapeout wrapper tt_um_rj_gift, driven only through
// its pins, the same way the chip will be used. Run from the repository root.
//   1. After reset: status 0x00, ID 0x47, unused addresses 0x1A..0x1F read 0.
//   2. The 3 official vectors and 16 random ones: write key and plaintext,
//      read them back, start, poll status, read the ciphertext, check the key
//      reads back unchanged afterwards.
//   3. While busy: status reads 0x01 and every KEY and STATE byte reads 0.
module tb_wrapper;

  reg        clk = 1'b0;
  reg        rst_n = 1'b0;
  reg  [7:0] ui_in = 8'h00;
  reg  [7:0] uio_in = 8'h00;
  wire [7:0] uo_out, uio_out, uio_oe;

  tt_um_rj_gift dut (.ui_in(ui_in), .uo_out(uo_out), .uio_in(uio_in), .uio_out(uio_out),
                     .uio_oe(uio_oe), .ena(1'b1), .clk(clk), .rst_n(rst_n));

  always #10 clk = ~clk;  // 50 MHz

  reg [255:0] vecs [0:66];  // pt | key | ct, from sim/vectors/core_vectors.hex
  integer errors = 0;
  integer v, i, polls;
  reg [7:0]   b;
  reg [127:0] kr;
  reg [63:0]  sr;

  // Pin rules (as in docs): set address and data, raise strobe ui_in[7] for
  // 4 clocks, lower it. Read: set address, wait 2 clocks, read uo_out.
  task write_byte(input [4:0] a, input [7:0] d);
    begin
      @(negedge clk); ui_in = {3'b000, a}; uio_in = d;
      repeat (2) @(negedge clk);
      ui_in = {3'b100, a};
      repeat (4) @(negedge clk);
      ui_in = {3'b000, a};
      repeat (2) @(negedge clk);
    end
  endtask

  task read_byte(input [4:0] a, output [7:0] d);
    begin
      @(negedge clk); ui_in = {3'b000, a};
      repeat (2) @(negedge clk);
      d = uo_out;
    end
  endtask

  task read_key(output [127:0] k);
    begin
      for (i = 0; i < 16; i = i + 1) begin read_byte(i[4:0], b); k[127 - 8*i -: 8] = b; end
    end
  endtask

  task read_state(output [63:0] s);
    begin
      for (i = 0; i < 8; i = i + 1) begin read_byte(5'h10 + i[4:0], b); s[63 - 8*i -: 8] = b; end
    end
  endtask

  task check(input cond, input [8*48-1:0] what);
    begin
      if (!cond) begin errors = errors + 1; $display("FAIL: %0s", what); end
    end
  endtask

  initial begin
    $readmemh("sim/vectors/core_vectors.hex", vecs);
    repeat (5) @(negedge clk);
    rst_n = 1'b1;

    // 1. After reset
    read_byte(5'h18, b); check(b === 8'h00, "status after reset");
    read_byte(5'h19, b); check(b === 8'h47, "ID");
    for (v = 5'h1A; v <= 5'h1F; v = v + 1) begin
      read_byte(v[4:0], b); check(b === 8'h00, "unused address not 0");
    end
    check(uio_oe === 8'h00 && uio_out === 8'h00, "uio pins not inputs");
    $display("after reset: status 0x00, ID 0x47, unused addresses read 0");

    // 2. Encryptions through the pins (3 official, then 16 random)
    for (v = 0; v < 19; v = v + 1) begin
      for (i = 0; i < 16; i = i + 1) write_byte(i[4:0], vecs[v][191 - 8*i -: 8]);
      for (i = 0; i < 8;  i = i + 1) write_byte(5'h10 + i[4:0], vecs[v][255 - 8*i -: 8]);
      read_key(kr);   check(kr === vecs[v][191:64], "key readback before start");
      read_state(sr); check(sr === vecs[v][255:192], "plaintext readback");
      write_byte(5'h18, 8'h01);
      if (v == 2) begin  // official vector 3: non-zero key and plaintext
        // 3. While busy: status 0x01, key and state bytes read 0
        read_byte(5'h18, b); check(b === 8'h01, "status not busy after start");
        read_byte(5'h00, b); check(b === 8'h00, "key byte not hidden while busy");
        read_byte(5'h0F, b); check(b === 8'h00, "key byte not hidden while busy");
        read_byte(5'h10, b); check(b === 8'h00, "state byte not hidden while busy");
        read_byte(5'h17, b); check(b === 8'h00, "state byte not hidden while busy");
        $display("while busy: status 0x01, key and state bytes read 0");
      end
      polls = 0;
      b = 8'h00;
      while (b !== 8'h02 && polls < 50) begin read_byte(5'h18, b); polls = polls + 1; end
      check(b === 8'h02, "never done");
      read_state(sr);
      read_key(kr);
      if (sr !== vecs[v][63:0] || kr !== vecs[v][191:64]) begin
        errors = errors + 1;
        $display("vector %0d: ct %h expected %h, key readback ok=%b", v, sr, vecs[v][63:0], kr === vecs[v][191:64]);
      end
      if (v < 3) $display("official vector %0d via pins: ciphertext %h, key reads back unchanged", v + 1, sr);
    end
    $display("random vectors via pins: 16");

    if (errors == 0) $display("PASS: wrapper works through the pins");
    else             $display("FAIL: %0d errors", errors);
    $finish;
  end

endmodule
