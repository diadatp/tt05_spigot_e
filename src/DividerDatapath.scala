package spigot_e

import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.sim._

case class DividerDatapath(nWidth: Int = 11, dWidth: Int = 6) extends Component {
  val io = new Bundle {
    val divisor = in UInt (dWidth bits)
    val accumulatorCurr = in UInt (2 * nWidth bits)
    val accumulatorNext = out UInt (2 * nWidth bits)
    val quotient = out UInt (dWidth bits)
    val remainder = out UInt (dWidth bits)
  }

  io.quotient := io.accumulatorNext.subdivideIn(2 slices)(0).resized
  io.remainder := io.accumulatorNext.subdivideIn(2 slices)(1).resized

  val accumulator_lshift = io.accumulatorCurr |<< 1
  val difference = accumulator_lshift(nWidth, nWidth bits) - io.divisor

  when(accumulator_lshift(nWidth, nWidth bits) >= io.divisor) {
    io.accumulatorNext := difference @@ accumulator_lshift(1, (nWidth - 1) bits) @@ U(1)
  } otherwise {
    io.accumulatorNext := accumulator_lshift
  }
}

object DividerDatapathVerilog extends App {
  Config.spinal.generateVerilog(DividerDatapath())
}

object DividerDatapathSim extends App {
  val dut = Config.sim.withWave.compile(DividerDatapath())

  dut.doSim("simple test") { dut =>
    dut.clockDomain.forkStimulus(10)

    dut.io.divisor #= 11
    dut.io.accumulatorCurr #= 10

    for (idx <- 0 to 100) {
      dut.clockDomain.waitRisingEdge()
    }
  }
}
