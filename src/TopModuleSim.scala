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

    var modelState = 0
    for (idx <- 0 to 200) {
      dut.clockDomain.waitRisingEdge()
    }
  }
}
