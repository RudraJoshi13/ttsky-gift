/*
 * Copyright (c) 2026 Rudra Joshi
 * SPDX-License-Identifier: Apache-2.0
 *
 * Tiny Tapeout wrapper for the GIFT-64-128 encryption core (gift64_core.v).
 * GIFT: Banik et al., "GIFT: A Small Present", CHES 2017.
 *
 * Pins:
 *   ui_in[4:0]   byte address
 *   ui_in[7]     write strobe (synchronised in strobe_sync.v)
 *   uio_in[7:0]  write data
 *   uo_out[7:0]  read data at the selected address (registered)
 *
 * Address map:
 *   0x00..0x0F  KEY    key[127:120] at 0x00 ... key[7:0] at 0x0F   (R/W)
 *   0x10..0x17  STATE  write: plaintext, pt[63:56] at 0x10 ...       (R/W)
 *                      read:  plaintext before start, ciphertext after done
 *   0x18        write: bit 0 = 1 starts an encryption (ignored while busy)
 *               read:  bit 0 = busy, bit 1 = done
 *   0x19        ID, reads 0x47 (ASCII 'G')
 *   0x1A..0x1F  read 0, writes ignored
 *
 * The byte writes go straight into the core's own state and key registers.
 * While busy (33 clocks per block) writes are ignored and KEY and STATE
 * reads return 0, so intermediate round values never appear on the pins.
 * After done the key register holds the original key again.
 */

`default_nettype none

module tt_um_rj_gift (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire [4:0] addr  = ui_in[4:0];
  wire [7:0] wdata = uio_in;

  // Write strobe from the pin: one-clock pulse per rising edge
  wire wr_pulse;
  strobe_sync u_sync (.clk(clk), .rst_n(rst_n), .strobe_in(ui_in[7]), .pulse(wr_pulse));

  wire core_wr = wr_pulse & (addr <= 5'h17);                 // key and state bytes
  wire start   = wr_pulse & (addr == 5'h18) & wdata[0];

  // GIFT-64-128 core
  wire [63:0]  state;
  wire [127:0] key;
  wire         busy, done;

  gift64_core u_core (
      .clk(clk), .rst_n(rst_n),
      .wr_en(core_wr), .wr_addr(addr), .wr_data(wdata),
      .start(start),
      .state(state), .key(key), .busy(busy), .done(done)
  );

  // Read multiplexer
  reg [7:0] rdata;
  always @(*) begin
    case (addr)
      5'h00: rdata = key[127:120];
      5'h01: rdata = key[119:112];
      5'h02: rdata = key[111:104];
      5'h03: rdata = key[103:96];
      5'h04: rdata = key[95:88];
      5'h05: rdata = key[87:80];
      5'h06: rdata = key[79:72];
      5'h07: rdata = key[71:64];
      5'h08: rdata = key[63:56];
      5'h09: rdata = key[55:48];
      5'h0A: rdata = key[47:40];
      5'h0B: rdata = key[39:32];
      5'h0C: rdata = key[31:24];
      5'h0D: rdata = key[23:16];
      5'h0E: rdata = key[15:8];
      5'h0F: rdata = key[7:0];
      5'h10: rdata = state[63:56];
      5'h11: rdata = state[55:48];
      5'h12: rdata = state[47:40];
      5'h13: rdata = state[39:32];
      5'h14: rdata = state[31:24];
      5'h15: rdata = state[23:16];
      5'h16: rdata = state[15:8];
      5'h17: rdata = state[7:0];
      5'h18: rdata = {6'b000000, done, busy};  // status
      5'h19: rdata = 8'h47;                     // ID: ASCII 'G'
      default: rdata = 8'h00;                   // 0x1A to 0x1F: unused
    endcase
    if (busy && addr <= 5'h17)
      rdata = 8'h00;                            // hide values while busy
  end

  reg [7:0] rdata_q;
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
      rdata_q <= 8'h00;
    else
      rdata_q <= rdata;
  end

  assign uo_out  = rdata_q;
  assign uio_out = 8'h00;
  assign uio_oe  = 8'h00;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, ui_in[6:5], 1'b0};

endmodule
