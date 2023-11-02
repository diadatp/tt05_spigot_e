package spigot_e

import spinal.core._
import spinal.core.sim._

object Config {
  def spinal = SpinalConfig(
    targetDirectory = "src/",
    defaultConfigForClockDomains = ClockDomainConfig(
      resetActiveLevel = LOW,
      resetKind = SYNC
    ),
    onlyStdLogicVectorAtTopLevelIo = true
  )
  def sim = SimConfig.withConfig(spinal).withIVerilog.withWave
}
