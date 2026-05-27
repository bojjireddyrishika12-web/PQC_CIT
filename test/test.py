import cocotb
from cocotb.clock import Clock
from cocotb.triggers import Timer, ClockCycles

@cocotb.test()
async def test_project(dut):
    cocotb.start_soon(Clock(dut.clk, 20, units="ns").start())
    dut.rst_n.value  = 0
    dut.ui_in.value  = 0
    dut.uio_in.value = 0
    dut.ena.value    = 1
    await Timer(40, units="ns")
    dut.rst_n.value  = 1
    await Timer(20, units="ns")

    for x in [0, 1, 3, 5, 6, 10, 15, 16]:
        expected = (x * 3) % 17
        dut.ui_in.value = x
        await ClockCycles(dut.clk, 2)
        assert int(dut.uo_out.value) == expected, \
            f"FAIL: input={x} expected={expected} got={int(dut.uo_out.value)}"
        assert (int(dut.uio_out.value) & 0x03) == 0x03
        dut._log.info(f"PASS: {x} -> {int(dut.uo_out.value)}")
