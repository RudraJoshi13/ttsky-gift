<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project puts the GIFT-64-128 block cipher on Tiny Tapeout. GIFT (Banik et al., "GIFT: A Small Present",
CHES 2017) is a lightweight cipher designed as an improved successor to PRESENT. GIFT-64-128 has a 64-bit block,
a 128-bit key and 28 rounds. The core is written by hand from the paper and encrypts only.

Each round has three steps. SubCells passes each of the 16 four-bit nibbles of the state through the GIFT S-box.
PermBits moves every bit of the state to a new position given by a fixed table (Table 4 of the paper), which is
plain wiring in hardware. AddRoundKey XORs 32 key bits and a 6-bit round constant into the state. After each round
the key register is rotated and the round constant is updated by a 6-bit LFSR.

The core is round-based, with 16 S-boxes, so one round takes one clock cycle. The key schedule returns the key
to its original value after 32 updates, so the core runs the key update for 4 more clock cycles after the last
round. When the encryption finishes, the key register holds the original key again, and the next block with the
same key needs only a new plaintext.

An encryption takes 33 clock cycles: the start cycle, 28 round cycles and 4 key restore cycles. Busy is high for
32 of them. The ciphertext is ready when busy clears and done is set.

Tiny Tapeout has 24 I/O pins, so the chip uses a byte-wide register interface. The key and plaintext are written
one byte at a time, an encryption is started with a control write, and the ciphertext is read back one byte at a
time. The byte writes go directly into the core's own key and state registers.

| Pins | Function |
|------|----------|
| `ui[4:0]` | byte address |
| `ui[7]` | write strobe, active high (synchronised inside the chip) |
| `ui[6:5]` | not used |
| `uio[7:0]` | write data byte (all `uio` pins are inputs) |
| `uo[7:0]` | read data byte at the selected address (registered) |

Multi-byte values are stored most significant byte first.

| Address | Register | Access |
|---------|----------|--------|
| `0x00` to `0x0F` | Key: `0x00` holds bits 127:120, `0x0F` holds bits 7:0 | read and write |
| `0x10` to `0x17` | State: `0x10` holds bits 63:56, `0x17` holds bits 7:0. Write the plaintext here; after done it holds the ciphertext | read and write |
| `0x18` | Control and status: write bit 0 = 1 to start; read bit 0 = busy, bit 1 = done | read and write |
| `0x19` | ID, reads `0x47` (ASCII `G`) | read only |
| `0x1A` to `0x1F` | unused, read 0, writes ignored | |

While busy, the chip ignores all writes, including a second start, and the key and state addresses read 0, so
intermediate round values never appear on the pins. Done stays set until the next start or the next write to a
state byte.

Reset clears busy, done, the round constant and the read data register. The key and state registers have no reset,
so their contents are unknown after power-up or reset. Write the key and the plaintext before the first encryption.

## How to test

1. Reset the chip.
2. Write the 16 key bytes to addresses `0x00` to `0x0F`.
3. Write the 8 plaintext bytes to addresses `0x10` to `0x17`.
4. Write `0x01` to address `0x18`.
5. Read address `0x18` until it reads `0x02` (done, not busy).
6. Read the 8 ciphertext bytes from addresses `0x10` to `0x17`.

For the next block with the same key, repeat from step 3.

To write a byte: set `ui[4:0]` to the address and `uio[7:0]` to the data, raise `ui[7]`, hold it for at least 3
clock cycles with the address and data unchanged, then lower it. Keep `ui[7]` low for at least 3 clock cycles
before the next write. To read a byte: set `ui[4:0]` to the address and read `uo[7:0]` 2 or more clock cycles
later.

Test vectors from the GIFT designers' reference repository
([giftcipher/gift](https://github.com/giftcipher/gift), MIT licence):

| Plaintext | Key | Ciphertext |
|-----------|-----|------------|
| `0000000000000000` | `00000000000000000000000000000000` | `f62bc3ef34f775ac` |
| `fedcba9876543210` | `fedcba9876543210fedcba9876543210` | `c1b71f66160ff587` |
| `c450c7727a9b8a7d` | `bd91731eb6bc2713a1f9f6ffc75044e7` | `e3272885fa94ba8b` |

## External hardware

None. The RP2040 on the Tiny Tapeout demo board can drive `ui` and `uio` and read `uo`.
