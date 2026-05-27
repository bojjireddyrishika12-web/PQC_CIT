## How it works

This project implements an 8-bit Number Theoretic Transform (NTT) butterfly unit for Post-Quantum Cryptography. It computes `(x × 3) mod 17` where 3 is the primitive root and 17 is the prime modulus. The result is registered on every rising clock edge and output as 8-bit parallel data.

## How to test

Set `rst_n=0` to reset, then `rst_n=1` to start. Apply any value on `ui_in` and wait 2 clock cycles. The output on `uo_out` will equal `(input × 3) mod 17`. Both `uio_out[0]` (ready) and `uio_out[1]` (done) will be high during normal operation.

## External hardware

None required.
