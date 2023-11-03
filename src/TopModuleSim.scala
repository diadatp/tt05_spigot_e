package spigot_e

import spinal.core._
import spinal.core.sim._

object TopModuleSim extends App {
  Config.sim.compile(TopModule()).doSim { dut =>
    dut.clockDomain.forkStimulus(period = 10)

    dut.io.ena #= false

    for (idx <- 0 to 100) {
      dut.clockDomain.waitRisingEdge()
    }

    dut.io.ena #= true

    val e_str = "271828182845904523536028747135266249775724709"
    val e_ms = scala.collection.mutable.Queue(e_str.toList: _*)
    var digitModel = e_ms.dequeue().asDigit

    // approximately twice the clock cycles the design should take
    val totalCycles = (2 * (6 + dut.dataWidth.value) * dut.n * dut.n)

    var prevDigit = -1

    for (i <- 0 to totalCycles) {
      dut.clockDomain.waitRisingEdge()
      if (prevDigit != dut.io.digit0.toInt) {
        assert(
          dut.io.digit0.toInt == digitModel,
          s"dut.io.digit0 mismatch. io.digit0=${dut.io.digit0.toInt} digitModel=$digitModel"
        )
        digitModel = e_ms.dequeue().asDigit
        prevDigit = dut.io.digit0.toInt
      }
    }
  }
}
