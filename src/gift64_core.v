`default_nettype none
// GIFT-64-128 encryption core, round-based (one round per clock), following
// the round-based implementation in Banik et al., CHES 2017, Section 5.1.
//
// The byte interface writes directly into the cipher's own registers:
//   wr_addr 0x00..0x0F: key bytes, key[127:120] at 0x00 ... key[7:0] at 0x0F
//   wr_addr 0x10..0x17: state bytes (plaintext), state[63:56] at 0x10 ...
// Writes are ignored while busy. A write to a state byte clears done.
//
// Timing (one clock edge each):
//   E0      start is high: busy <= 1, constant <= 0
//   E1-E28  one round per edge: state, key and constant all update
//   E29-E32 key restore: only the key and constant update; after 32 key
//           updates the key register holds the original key again
//   E32     busy <= 0, done <= 1. The state register holds the ciphertext.
// The round constant LFSR doubles as the round counter: it reaches 6'h0B
// after round 28 and 6'h38 after clock 32 (neither value occurs earlier).
//
// Only the control registers (busy, phase, done, constant) have a reset.
// The 192 data flip-flops are undefined until written.
module gift64_core (
    input  wire         clk,
    input  wire         rst_n,
    input  wire         wr_en,     // write wr_data to the byte at wr_addr
    input  wire [4:0]   wr_addr,
    input  wire [7:0]   wr_data,
    input  wire         start,     // one clock; ignored while busy
    output reg  [63:0]  state,     // plaintext before start, ciphertext when done
    output reg  [127:0] key,       // the key (moving only while busy)
    output reg          busy,
    output reg          done
);

  reg       phase;  // 0: cipher rounds, 1: key restore
  reg [5:0] rc;     // round constant c5..c0

  wire [5:0]   rc_next;
  wire [63:0]  round_out;
  wire [127:0] key_next;

  gift_rc_update  u_rc    (.rc_in(rc), .rc_out(rc_next));
  gift_round      u_round (.state_in(state), .round_key(key[31:0]), .rc(rc_next),
                           .state_out(round_out));
  gift_key_update u_key   (.key_in(key), .key_out(key_next));

  wire state_write = wr_en && (wr_addr[4:3] == 2'b10);  // 0x10..0x17

  // Control
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      busy  <= 1'b0;
      phase <= 1'b0;
      done  <= 1'b0;
      rc    <= 6'h00;
    end else if (start && !busy) begin
      busy  <= 1'b1;
      phase <= 1'b0;
      done  <= 1'b0;
      rc    <= 6'h00;
    end else if (busy) begin
      rc <= rc_next;
      if (rc_next == 6'h0B) phase <= 1'b1;  // round 28 done
      if (rc_next == 6'h38) begin           // clock 32: key restored
        busy <= 1'b0;
        done <= 1'b1;
      end
    end else if (state_write) begin
      done <= 1'b0;                          // new plaintext: old result gone
    end
  end

  // Data registers (no reset)
  always @(posedge clk) begin
    if (busy) begin
      key <= key_next;
      if (!phase) state <= round_out;
    end else if (wr_en) begin
      case (wr_addr)
      5'h00: key[127:120] <= wr_data;
      5'h01: key[119:112] <= wr_data;
      5'h02: key[111:104] <= wr_data;
      5'h03: key[103:96] <= wr_data;
      5'h04: key[95:88] <= wr_data;
      5'h05: key[87:80] <= wr_data;
      5'h06: key[79:72] <= wr_data;
      5'h07: key[71:64] <= wr_data;
      5'h08: key[63:56] <= wr_data;
      5'h09: key[55:48] <= wr_data;
      5'h0A: key[47:40] <= wr_data;
      5'h0B: key[39:32] <= wr_data;
      5'h0C: key[31:24] <= wr_data;
      5'h0D: key[23:16] <= wr_data;
      5'h0E: key[15:8] <= wr_data;
      5'h0F: key[7:0] <= wr_data;
      5'h10: state[63:56] <= wr_data;
      5'h11: state[55:48] <= wr_data;
      5'h12: state[47:40] <= wr_data;
      5'h13: state[39:32] <= wr_data;
      5'h14: state[31:24] <= wr_data;
      5'h15: state[23:16] <= wr_data;
      5'h16: state[15:8] <= wr_data;
      5'h17: state[7:0] <= wr_data;
      default: ;
      endcase
    end
  end

endmodule
