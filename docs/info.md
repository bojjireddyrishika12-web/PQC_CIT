<!---
This file is used to generate your project datasheet. 
-->

## How it works

This project implements an 8-bit Number Theoretic Transform (NTT) butterfly unit for Post-Quantum Cryptography. It computes the operation `(x × w) mod q` where `w=3` (primitive root) and `q=17` (prime modulus). The 8-bit input data is fed through a single NTT butterfly unit on every clock cycle. The result is registered on the rising edge of the clock and presented as an 8-bit parallel output. Status flags `ready` and `done` are set high after reset is released, indicating the core is operational.

## How to test

Apply an 8-bit input value on `ui_in`. After releasing reset (`rst_n=1`), wait 2 clock cycles for the output to be valid on `uo_out`. The output will equal `(input × 3) mod 17`. For example, input `0x01` produces output `3`, input `0x06` produces output `1` (since 18 mod 17 = 1). Check `uio_out[0]` for `ready_flag` and `uio_out[1]` for `done_flag` — both should be high during normal operation.

## External hardware

None required.
