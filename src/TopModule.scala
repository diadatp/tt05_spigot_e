package spigot_e

import spinal.core._
import spinal.lib.fsm._

case class TopModule(n: Int) extends Component {
  val io = new Bundle {
    var ena = in Bool ()
    var digit0 = out UInt (4 bits)
    var digit1 = out UInt (4 bits)
    var digit2 = out UInt (4 bits)
    var digit3 = out UInt (4 bits)
  }

  val digits = Vec.fill(4)(Reg(UInt(4 bits)) init (0))

  when(io.ena) {
    digits(0) := U(2)
    for (i <- 1 to 3) {
      digits(i) := digits(i - 1)
    }
  }

  io.digit0 := digits(0)
  io.digit1 := digits(1)
  io.digit2 := digits(2)
  io.digit3 := digits(3)
}

object TopModuleVerilog extends App {
  Config.spinal.generateVerilog(TopModule(9))
}
