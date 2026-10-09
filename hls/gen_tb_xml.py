"""Write hls/test.xml, the input list for Bambu's generated testbench.

Bambu runs gift64_enc() twice for every <testbench> line: once as compiled C
and once as the generated Verilog in a simulator, and reports a mismatch if
the two differ. This file only supplies the inputs.

Inputs: the 3 official GIFT-64 vectors (read from model/vectors) and 5 random
vectors (seed 2017). The arrays use the reference's nibble order: element i
holds nibble i, element 0 being the least significant nibble.

The expected ciphertexts are written as XML comments for the reader; Bambu
ignores them.
"""
import os
import random
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "model"))
import gift64  # noqa: E402


def nibbles(value, n):
    return "{" + ",".join(str((value >> (4 * i)) & 0xF) for i in range(n)) + "}"


def main():
    vectors = []
    for n in (1, 2, 3):
        pt, key, ct, _ = gift64.read_vector(
            os.path.join(HERE, "..", "model", "vectors", f"GIFT64_test_vector_{n}.txt"))
        vectors.append((f"official vector {n}", pt, key, ct))
    rng = random.Random(2017)
    for i in range(5):
        pt, key = rng.getrandbits(64), rng.getrandbits(128)
        vectors.append((f"random vector {i}", pt, key, gift64.encrypt(pt, key)))

    lines = ['<?xml version="1.0"?>', "<function>"]
    for name, pt, key, ct in vectors:
        lines.append(f"  <!-- {name}: pt={pt:016x} key={key:032x} expected ct={ct:016x} -->")
        lines.append(f'  <testbench input="{nibbles(pt, 16)}" masterkey="{nibbles(key, 32)}"/>')
    lines.append("</function>")
    out = os.path.join(HERE, "test.xml")
    with open(out, "w") as f:
        f.write("\n".join(lines) + "\n")
    print(f"wrote {out}: {len(vectors)} vectors")


if __name__ == "__main__":
    main()
