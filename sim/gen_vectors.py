"""Write the expected values for the block testbenches in sim/, taken from
the golden model (model/gift64.py), which is itself checked against the
official GIFT-64 trace files.

Usage (from the repository root):  python3 sim/gen_vectors.py
"""

import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "model"))
import gift64  # noqa: E402

OUT = os.path.join(HERE, "vectors")
os.makedirs(OUT, exist_ok=True)

# Block 1: S-box. Line x holds GS(x), one hex digit per line.
with open(os.path.join(OUT, "sbox.hex"), "w") as f:
    for x in range(16):
        f.write(f"{gift64.SBOX[x]:x}\n")
print("wrote sim/vectors/sbox.hex (16 S-box outputs)")

# Block 2: bit permutation. Each line is "input output" (16 hex digits each).
# First 64 lines: a single 1 in bit i, so each line checks one wire.
# Then 64 random inputs (fixed seed, so the file is the same every time).
import random  # noqa: E402

rng = random.Random(2017)
with open(os.path.join(OUT, "perm.hex"), "w") as f:
    for i in range(64):
        x = 1 << i
        f.write(f"{x:016x} {gift64.perm_bits(x):016x}\n")
    for _ in range(64):
        x = rng.getrandbits(64)
        f.write(f"{x:016x} {gift64.perm_bits(x):016x}\n")
print("wrote sim/vectors/perm.hex (64 single-bit and 64 random inputs)")

# Block 3: one full round. Each line is one 168-bit word, 42 hex digits:
# state_in (16) | round_key = {k1, k0} (8) | round constant (2) | state_out (16).
# First 84 lines: all 28 rounds of the 3 official vectors (the same values as
# the official trace files). Then 64 random lines.
def round_line(s, key, c):
    out = gift64.add_round_key(gift64.perm_bits(gift64.sub_cells(s)), key, c)
    return f"{s:016x}{key & 0xFFFFFFFF:08x}{c:02x}{out:016x}\n", out

with open(os.path.join(OUT, "round.hex"), "w") as f:
    vdir = os.path.join(HERE, "..", "model", "vectors")
    for n in (1, 2, 3):
        pt, key, ct, _ = gift64.read_vector(os.path.join(vdir, f"GIFT64_test_vector_{n}.txt"))
        s, c = pt, 0
        for r in range(gift64.ROUNDS):
            c = gift64.update_constant(c)
            line, s = round_line(s, key, c)
            f.write(line)
            key = gift64.update_key(key)
        assert s == ct, "model does not reproduce the official ciphertext"
    for _ in range(64):
        line, _ = round_line(rng.getrandbits(64), rng.getrandbits(128), rng.getrandbits(6))
        f.write(line)
print("wrote sim/vectors/round.hex (84 official-vector rounds and 64 random rounds)")

# Block 4a: key update. Each line is key_in (32 hex) followed by key_out (32 hex),
# one 256-bit word. First 84 lines: the key before and after every round of the
# 3 official vectors (key_out equals the "updated Key" lines of the trace files).
# Then 64 random keys.
with open(os.path.join(OUT, "key.hex"), "w") as f:
    for n in (1, 2, 3):
        _, key, _, _ = gift64.read_vector(os.path.join(vdir, f"GIFT64_test_vector_{n}.txt"))
        for r in range(gift64.ROUNDS):
            nxt = gift64.update_key(key)
            f.write(f"{key:032x}{nxt:032x}\n")
            key = nxt
    for _ in range(64):
        key = rng.getrandbits(128)
        f.write(f"{key:032x}{gift64.update_key(key):032x}\n")
print("wrote sim/vectors/key.hex (84 official-vector key updates and 64 random keys)")

# Block 4b: round constant. All 64 possible 6-bit inputs, each line rc_in rc_out
# (2 hex digits each, one 16-bit word: rc_in in the upper byte).
with open(os.path.join(OUT, "rc.hex"), "w") as f:
    for c in range(64):
        f.write(f"{c:02x}{gift64.update_constant(c):02x}\n")
print("wrote sim/vectors/rc.hex (all 64 constant values)")

# Block 5: the clocked core.
# core_trace.hex: for each official vector, 33 lines (after edges E0 to E32),
#   each one 192-bit word: state (16 hex) | key (32 hex).
# core_vectors.hex: plaintext | key | ciphertext (64 hex digits per line):
#   3 official vectors, then 64 random.
# core_b2b.hex: two blocks with the same key: key | pt1 | ct1 | pt2 | ct2.
def core_trace(pt, key):
    lines, s, k, c = [(pt, key)], pt, key, 0
    for e in range(1, 33):
        c = gift64.update_constant(c)
        if e <= 28:
            s = gift64.add_round_key(gift64.perm_bits(gift64.sub_cells(s)), k, c)
        k = gift64.update_key(k)
        lines.append((s, k))
    assert k == key, "key not restored after 32 updates"
    return lines

with open(os.path.join(OUT, "core_trace.hex"), "w") as ft, \
     open(os.path.join(OUT, "core_vectors.hex"), "w") as fv:
    for n in (1, 2, 3):
        pt, key, ct, _ = gift64.read_vector(os.path.join(vdir, f"GIFT64_test_vector_{n}.txt"))
        tr = core_trace(pt, key)
        assert tr[28][0] == ct
        for s, k in tr:
            ft.write(f"{s:016x}{k:032x}\n")
        fv.write(f"{pt:016x}{key:032x}{ct:016x}\n")
    for _ in range(64):
        pt, key = rng.getrandbits(64), rng.getrandbits(128)
        fv.write(f"{pt:016x}{key:032x}{gift64.encrypt(pt, key):016x}\n")
with open(os.path.join(OUT, "core_b2b.hex"), "w") as f:
    for _ in range(4):
        key, p1, p2 = rng.getrandbits(128), rng.getrandbits(64), rng.getrandbits(64)
        f.write(f"{key:032x}{p1:016x}{gift64.encrypt(p1, key):016x}{p2:016x}{gift64.encrypt(p2, key):016x}\n")
print("wrote sim/vectors/core_trace.hex, core_vectors.hex, core_b2b.hex")
