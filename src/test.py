import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles

@cocotb.test()
async def test_single_key(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 1, units="us")
    cocotb.start_soon(clock.start())

    # reset
    dut._log.info("reset")
    dut.rst_n.value = 0
    dut.ena.value = 0
    dut.ui_in.value = 0
    dut.uio_in.value = 0

    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    dut.ena.value = 1

    await ClockCycles(dut.clk, 10000)
