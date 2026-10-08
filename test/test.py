# SPDX-FileCopyrightText: © 2026 Rudra Joshi
# SPDX-License-Identifier: Apache-2.0
#
# cocotb tests for tt_um_rj_gift (GIFT-64-128). Everything goes through the
# pins. Expected results come from the golden model model/gift64.py, which
# matches the official GIFT trace files (giftcipher/gift) line by line.

import os
import random
import sys

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "model"))
import gift64  # noqa: E402

# Address map (see docs/info.md)
A_KEY = 0x00     # 16 bytes, most significant first
A_STATE = 0x10   # 8 bytes: write plaintext, read ciphertext when done
A_CTRL = 0x18    # write bit 0 = start; read bit 0 = busy, bit 1 = done
A_ID = 0x19      # reads 0x47 ('G')
STROBE = 0x80    # ui_in[7]

VECTOR_DIR = os.path.join(HERE, "..", "model", "vectors")
OFFICIAL = [gift64.read_vector(os.path.join(VECTOR_DIR, f"GIFT64_test_vector_{n}.txt"))[:3]
            for n in (1, 2, 3)]  # (plaintext, key, ciphertext) from the official files


async def write_byte(dut, addr, value):
    """Set address and data, raise the strobe for 4 clocks, lower it."""
    dut.ui_in.value = addr
    dut.uio_in.value = value
    await ClockCycles(dut.clk, 2)
    dut.ui_in.value = STROBE | addr
    await ClockCycles(dut.clk, 4)
    dut.ui_in.value = addr
    await ClockCycles(dut.clk, 2)


async def read_byte(dut, addr):
    """Set the address, wait 2 clocks, read uo_out."""
    dut.ui_in.value = addr
    await ClockCycles(dut.clk, 2)
    return dut.uo_out.value.to_unsigned()


async def write_bytes(dut, base, value, nbytes):
    for i in range(nbytes):
        await write_byte(dut, base + i, (value >> (8 * (nbytes - 1 - i))) & 0xFF)


async def read_bytes(dut, base, nbytes):
    value = 0
    for i in range(nbytes):
        value = (value << 8) | await read_byte(dut, base + i)
    return value


async def wait_done(dut):
    for _ in range(100):
        if await read_byte(dut, A_CTRL) == 0x02:  # done = 1, busy = 0
            return
    assert False, "timeout waiting for done"


async def encrypt(dut, pt, key=None):
    """Write the key (unless None: keep the key already in the chip) and the
    plaintext, check the readback, start, wait, return the ciphertext."""
    if key is not None:
        await write_bytes(dut, A_KEY, key, 16)
    await write_bytes(dut, A_STATE, pt, 8)
    assert await read_bytes(dut, A_STATE, 8) == pt, "plaintext readback"
    await write_byte(dut, A_CTRL, 0x01)
    await wait_done(dut)
    return await read_bytes(dut, A_STATE, 8)


async def pulse_reset(dut):
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 2)


async def start_clock_and_reset(dut):
    cocotb.start_soon(Clock(dut.clk, 20, unit="ns").start())  # 50 MHz, as in info.yaml
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    await pulse_reset(dut)


@cocotb.test()
async def test_gift(dut):
    """ID and status after reset; the 3 official vectors; 20 random vectors
    checked against the golden model; key reads back unchanged each time."""
    await start_clock_and_reset(dut)
    assert await read_byte(dut, A_ID) == 0x47, "ID"
    assert await read_byte(dut, A_CTRL) == 0x00, "status after reset"

    for n, (pt, key, ct) in enumerate(OFFICIAL, 1):
        got = await encrypt(dut, pt, key)
        dut._log.info(f"official vector {n}: pt={pt:016x} key={key:032x} ct={got:016x} expected={ct:016x}")
        assert got == ct, f"official vector {n}"
        assert await read_bytes(dut, A_KEY, 16) == key, "key not restored"

    rng = random.Random(2017)
    for i in range(20):
        pt, key = rng.getrandbits(64), rng.getrandbits(128)
        got = await encrypt(dut, pt, key)
        assert got == gift64.encrypt(pt, key), f"random vector {i}: pt={pt:016x} key={key:032x}"
        assert await read_bytes(dut, A_KEY, 16) == key, "key not restored"
    dut._log.info("random vectors checked against the model: 20")


@cocotb.test()
async def test_back_to_back(dut):
    """Same key, new plaintext only: the key is written once and reused."""
    await start_clock_and_reset(dut)
    rng = random.Random(64)
    key = rng.getrandbits(128)
    await write_bytes(dut, A_KEY, key, 16)
    for i in range(5):
        pt = rng.getrandbits(64)
        assert await encrypt(dut, pt) == gift64.encrypt(pt, key), f"block {i} with the same key"
    assert await read_bytes(dut, A_KEY, 16) == key, "key changed after 5 blocks"
    dut._log.info("5 blocks with one key write: all correct, key unchanged")


@cocotb.test()
async def test_busy_protection(dut):
    """While busy: status 0x01, key and state bytes read 0, writes and a
    second start are ignored, and the result is still correct."""
    await start_clock_and_reset(dut)
    pt, key, ct = OFFICIAL[2]  # non-zero key and plaintext
    await write_bytes(dut, A_KEY, key, 16)
    await write_bytes(dut, A_STATE, pt, 8)
    await write_byte(dut, A_CTRL, 0x01)  # start (busy for 33 clocks)
    assert await read_byte(dut, A_CTRL) == 0x01, "not busy after start"
    assert await read_byte(dut, A_KEY) == 0x00, "key byte visible while busy"
    assert await read_byte(dut, A_STATE) == 0x00, "state byte visible while busy"
    await write_byte(dut, A_KEY, 0x5A)       # ignored
    await write_byte(dut, A_CTRL, 0x01)      # ignored (still busy)
    await wait_done(dut)
    assert await read_bytes(dut, A_STATE, 8) == ct, "result changed by writes while busy"
    assert await read_bytes(dut, A_KEY, 16) == key, "key changed by a write while busy"
    assert await read_byte(dut, A_CTRL) == 0x02, "a second encryption ran"
    dut._log.info("while busy: values hidden, writes and second start ignored")


@cocotb.test()
async def test_register_rules(dut):
    """Unused addresses read 0; writes to ID and unused addresses are ignored;
    start needs bit 0; a held strobe starts once; ui_in[6:5] are ignored."""
    await start_clock_and_reset(dut)
    pt, key, ct = OFFICIAL[1]
    assert await encrypt(dut, pt, key) == ct

    for a in range(0x1A, 0x20):
        assert await read_byte(dut, a) == 0x00, f"address {a:#04x} not 0"
    for a in [A_ID] + list(range(0x1A, 0x20)):
        await write_byte(dut, a, 0xA5)
    assert await read_byte(dut, A_ID) == 0x47, "ID changed by a write"
    for a in range(0x1A, 0x20):
        assert await read_byte(dut, a) == 0x00, "unused address changed"
    assert await read_bytes(dut, A_STATE, 8) == ct, "ciphertext changed"
    assert await read_bytes(dut, A_KEY, 16) == key, "key changed"
    dut._log.info("unused reads are 0, ID and unused writes ignored")

    await write_byte(dut, A_CTRL, 0xFE)
    assert await read_byte(dut, A_CTRL) == 0x02, "started without bit 0"
    dut._log.info("start write without bit 0: no start")

    # Strobe held high on a start for 120 clocks (more than 3 encryptions):
    # busy must rise exactly once.
    await write_bytes(dut, A_STATE, pt, 8)
    dut.uio_in.value = 0x01
    dut.ui_in.value = STROBE | A_CTRL
    rises, prev = 0, 0
    for _ in range(120):
        await ClockCycles(dut.clk, 1)
        busy = dut.uo_out.value.to_unsigned() & 1
        if busy and not prev:
            rises += 1
        prev = busy
    dut.ui_in.value = A_CTRL
    await ClockCycles(dut.clk, 2)
    assert rises == 1, f"busy rose {rises} times with the strobe held"
    assert await read_bytes(dut, A_STATE, 8) == ct, "wrong ciphertext after held strobe"
    dut._log.info("strobe held 120 clocks: exactly one encryption")

    dut.ui_in.value = 0x60 | A_ID
    await ClockCycles(dut.clk, 2)
    assert dut.uo_out.value.to_unsigned() == 0x47, "ui_in[6:5] changed the read"
    dut.ui_in.value = A_ID
    await ClockCycles(dut.clk, 2)
    dut._log.info("ui_in[5] and ui_in[6] ignored")


@cocotb.test()
async def test_reset(dut):
    """Reset during an encryption stops it (status 0x00) and the next
    encryption is correct. Key and state flip-flops have no reset by design,
    so the test writes them again before reusing them."""
    await start_clock_and_reset(dut)
    pt, key, ct = OFFICIAL[2]
    await write_bytes(dut, A_KEY, key, 16)
    await write_bytes(dut, A_STATE, pt, 8)
    await write_byte(dut, A_CTRL, 0x01)
    assert await read_byte(dut, A_CTRL) == 0x01, "expected busy before reset"
    await pulse_reset(dut)
    assert await read_byte(dut, A_CTRL) == 0x00, "status not cleared by reset"
    assert await encrypt(dut, pt, key) == ct, "encryption after reset"
    dut._log.info("reset during encryption: status cleared, next encryption correct")
