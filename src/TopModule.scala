package spigot_e

import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.fsm._
import spinal.lib.sim._

case class TopModule(n: Int = 30, dataWidth: BitCount = 5 bits, period: Int = 11) extends Component {
  val io = new Bundle {
    val ena = in Bool ()
    val digit0 = out UInt (4 bits)
    val digit1 = out UInt (4 bits)
    val digit2 = out UInt (4 bits)
    val digit3 = out UInt (4 bits)
  }

  val digits = Vec.fill(4)(Reg(UInt(4 bits)) init (0))

  // outer loop runs (n - 1) times from 0 to (n - 2)
  val outerCounter = Counter(n - 2)

  // inner loop runs (n + 1) times from (n + 2) to 2
  val innerCounter = Reg(UInt(log2Up(n + 3) bits)) init (n + 2)

  // sliding window from 0 to (period - 1)
  val slideCounter = CounterFreeRun(1 + dataWidth.value + 4 + 1)

  val dataIsValid = (slideCounter === 0)
  val startOfInnerLoop = (innerCounter === (n + 2))
  val startOfOuterLoop = (outerCounter === 0)

  val mem = Vec(Reg(UInt(dataWidth)) init (1), n + 1)

  when(slideCounter.willOverflow) {
    when(innerCounter === 2) {
      when(outerCounter.willOverflowIfInc) {
        // do nothing?
      } otherwise {
        innerCounter := n + 2
        outerCounter.increment()
      }
    } otherwise {
      innerCounter := innerCounter - 1
    }
  }

  when(slideCounter.willOverflow) {
    mem(n) := mem(0)
    for (i <- 1 to n) {
      mem(i - 1) := mem(i)
    }
  }

  val opWidth = ((UInt(dataWidth) * 10) +^ UInt(dataWidth)).getWidth

  val accumulator = Reg(UInt((2 * opWidth) bits)) init (0)

  val quotient = accumulator(0, dataWidth)
  val remainder = accumulator(opWidth, dataWidth)

  val accumulator_lshift = accumulator |<< 1
  val diff = accumulator_lshift(((2 * opWidth) - 1) downto opWidth) - innerCounter

  when(dataIsValid) {

    when(startOfInnerLoop) {
      // the input quotient is zero at the start of the loop
      accumulator := (mem(0) * 10).resized
    } otherwise {
      // get input quotient from previous division
      accumulator := ((mem(0) * 10) +^ quotient).resized
    }

    // store the remainder except when the algorithm starts
    when(~(startOfInnerLoop && startOfOuterLoop)) {
      mem(n) := remainder
    }

  } otherwise {
    when(accumulator_lshift(opWidth, opWidth bits) >= innerCounter) {
      accumulator := diff(0, opWidth bits) @@ accumulator_lshift(1, (opWidth - 1) bits) @@ U(1)
    } otherwise {
      accumulator := accumulator_lshift
    }
  }

  when(dataIsValid) {
    when(startOfInnerLoop) {
      when(startOfOuterLoop) {
        digits(0) := 2
      } otherwise {
        digits(0) := quotient.resized
      }
      for (i <- 1 to 3) {
        digits(i) := digits(i - 1)
      }
    }
  }

  io.digit0 := digits(0)
  io.digit1 := digits(1)
  io.digit2 := digits(2)
  io.digit3 := digits(3)
}

object TopModuleVerilog extends App {
  Config.spinal.generateVerilog(TopModule())
}
