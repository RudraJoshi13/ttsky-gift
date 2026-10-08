"""GIFT-64-128 golden model (encryption only).

Written from the specification in Banik et al., "GIFT: A Small Present",
CHES 2017, Section 2 (Tables 3 and 4, key schedule, round constants).
Running this file checks the model against the official trace files in
model/vectors (from github.com/giftcipher/gift, MIT licence): every
intermediate line of all 28 rounds, and the final ciphertext.

Usage (from the repository root):  python3 model/gift64.py

Bit numbering follows the paper: bit 63 is the most significant bit of
the state, nibble n holds bits 4n+3..4n. The key is 128 bits held as
eight 16-bit words k7..k0, with k0 = key bits 15..0.
"""

import os
import re
import sys

ROUNDS = 28

# Table 3: the GIFT S-box GS.
SBOX = [0x1, 0xA, 0x4, 0xC, 0x6, 0xF, 0x3, 0x9,
        0x2, 0xD, 0xB, 0x7, 0x5, 0x0, 0x8, 0xE]

# Table 4: bit i of the state moves to bit PERM[i].
PERM = [0, 17, 34, 51, 48, 1, 18, 35, 32, 49, 2, 19, 16, 33, 50, 3,
        4, 21, 38, 55, 52, 5, 22, 39, 36, 53, 6, 23, 20, 37, 54, 7,
        8, 25, 42, 59, 56, 9, 26, 43, 40, 57, 10, 27, 24, 41, 58, 11,
        12, 29, 46, 63, 60, 13, 30, 47, 44, 61, 14, 31, 28, 45, 62, 15]


def sub_cells(s):
    """Apply the S-box to each of the 16 nibbles."""
    out = 0
    for n in range(16):
        out |= SBOX[(s >> (4 * n)) & 0xF] << (4 * n)
    return out


def perm_bits(s):
    """Move every bit i to position PERM[i]."""
    out = 0
    for i in range(64):
        out |= ((s >> i) & 1) << PERM[i]
    return out


def add_round_key(s, key, c):
    """U = k1 goes to bit 4n+1, V = k0 goes to bit 4n of nibble n.
    Constant bits c5..c0 go to bits 23, 19, 15, 11, 7, 3; bit 63 gets 1."""
    u = (key >> 16) & 0xFFFF
    v = key & 0xFFFF
    for n in range(16):
        s ^= ((u >> n) & 1) << (4 * n + 1)
        s ^= ((v >> n) & 1) << (4 * n)
    for j, pos in enumerate([3, 7, 11, 15, 19, 23]):  # c0 .. c5
        s ^= ((c >> j) & 1) << pos
    s ^= 1 << 63
    return s


def rotr16(w, r):
    """Rotate a 16-bit word right by r bits."""
    return ((w >> r) | (w << (16 - r))) & 0xFFFF


def update_key(key):
    """New k7 = k1 >>> 2, new k6 = k0 >>> 12, new k5..k0 = old k7..k2."""
    k = [(key >> (16 * i)) & 0xFFFF for i in range(8)]  # k[0] is k0
    new = k[2:] + [rotr16(k[0], 12), rotr16(k[1], 2)]
    out = 0
    for i, w in enumerate(new):
        out |= w << (16 * i)
    return out


def update_constant(c):
    """6-bit LFSR: (c5..c0) <- (c4, c3, c2, c1, c0, c5 xor c4 xor 1)."""
    return ((c << 1) & 0x3F) | (((c >> 5) ^ (c >> 4) ^ 1) & 1)


def hexbytes(value, nbytes):
    """Format like the trace files: bytes, most significant first."""
    return " ".join(f"{(value >> (8 * i)) & 0xFF:02x}" for i in reversed(range(nbytes)))


def encrypt(pt, key, trace=None):
    """Encrypt one 64-bit block. If trace is a list, append one line per
    step in the same format as the official trace files."""
    s, c = pt, 0
    for r in range(ROUNDS):
        s = sub_cells(s)
        if trace is not None:
            trace.append(f"{r}: after SubCells: {hexbytes(s, 8)}")
        s = perm_bits(s)
        if trace is not None:
            trace.append(f"{r}: after PermBits: {hexbytes(s, 8)}")
        c = update_constant(c)          # updated before use
        s = add_round_key(s, key, c)
        if trace is not None:
            trace.append(f"{r}: after AddRoundKeys: {hexbytes(s, 8)}")
        key = update_key(key)
        if trace is not None:
            trace.append(f"{r}: updated Key: {hexbytes(key, 16)}")
    return s


def read_vector(path):
    """Return plaintext, key, ciphertext and the encryption trace lines."""
    text = open(path).read()
    enc = text.split("decryption...")[0]
    num = lambda name: int(re.search(rf"^{name} = ([0-9a-f ]+)", text, re.M).group(1).replace(" ", ""), 16)
    lines = [ln.strip() for ln in enc.splitlines()
             if re.match(r"\s*\d+: (after|updated)", ln)]
    return num("Plaintext"), num("masterkey"), num("Ciphertext"), lines


def main():
    here = os.path.join(os.path.dirname(os.path.abspath(__file__)), "vectors")
    all_ok = True
    for n in (1, 2, 3):
        pt, key, ct, ref = read_vector(os.path.join(here, f"GIFT64_test_vector_{n}.txt"))
        mine = []
        got = encrypt(pt, key, mine)
        same = sum(a == b for a, b in zip(mine, ref))
        ok = got == ct and same == len(ref) == len(mine)
        all_ok &= ok
        print(f"vector {n}: pt={pt:016x} key={key:032x}")
        print(f"   ciphertext {got:016x}  expected {ct:016x}   trace lines matching: {same}/{len(ref)}   {'PASS' if ok else 'FAIL'}")
        if not ok:
            for a, b in zip(mine, ref):
                if a != b:
                    print(f"   first difference:\n     model: {a}\n     file:  {b}")
                    break
    print("ALL PASS" if all_ok else "SOME FAILED")
    return 0 if all_ok else 1


if __name__ == "__main__":
    sys.exit(main())
