package spigot_e

import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.fsm._
import spinal.lib.sim._

case class TopModule(n: Int = 32, dataWidth: BitCount = 6 bits, period: Int = 11) extends Component {
  val io = new Bundle {
    val ena = in Bool ()
    val digit0 = out UInt (4 bits)
    val digit1 = out UInt (4 bits)
    val digit2 = out UInt (4 bits)
    val digit3 = out UInt (4 bits)
  }

  val digits = Vec.fill(4)(Reg(UInt(4 bits)) init (0))

  // outer loop should run (n - 1) times from 0 to (n - 2)
  // but we run once more to output the last digit
  val outerCounter = Counter(n)

  // inner loop runs (n + 1) times from (n + 2) to 2
  val innerCounter = Reg(UInt(log2Up(n + 3) bits)) init (n + 2)

  // sliding window from 0 to (period - 1)
  val slideCounter = Counter(dataWidth.value, io.ena)

  val dataIsValid = (slideCounter === 0)
  val startOfInnerLoop = (innerCounter === (n + 2))
  val startOfOuterLoop = (outerCounter === 0)

  val mem = Vec(Reg(UInt(dataWidth)) init (32), n + 1)

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

  val opWidth = dataWidth.value + 4

  val div1 = new DividerDatapath(dataWidth.value + 4, dataWidth.value)
  val div2 = new DividerDatapath(dataWidth.value + 4, dataWidth.value)

  val accumulator = Reg(UInt(div1.io.accumulatorCurr.getWidth bits)) init (0)
  val quotient = accumulator(0, dataWidth)

  div2.io.divisor <> innerCounter
  div1.io.divisor <> innerCounter

  div1.io.accumulatorCurr <> accumulator.resized
  div2.io.accumulatorCurr <> div1.io.accumulatorNext

  when(dataIsValid) {
    when(startOfInnerLoop) {
      // the input quotient is zero at the start of the loop
      accumulator := (mem(0) * 10).resized
      // accumulator := ((U(mem(1)(0)) @@ mem(0)(5 downto 1)) * 10).resized
    } otherwise {
      // get input quotient from previous division
      accumulator := ((mem(0) * 10) +^ accumulator(0, dataWidth)).resized
      // accumulator := (((U(mem(1)(0)) @@ mem(0)(5 downto 1)) * 10) +^ accumulator(0, dataWidth)).resized
    }
  } otherwise {
    accumulator := div2.io.accumulatorNext.resized
    // accumulator := 6
  }

  // when(slideCounter.willOverflow) {
  //   // store the remainder except when the algorithm starts
  //   when(~(startOfInnerLoop && startOfOuterLoop)) {
  //     mem(n) := div2.io.remainder
  //   } otherwise {
  //     mem(n) := mem(0)
  //   }
  // }

  // across two registers
  for (i <- 0 to n) {
    if (i > 0) {
      mem(i - 1)(0) := mem(i)(dataWidth.value - 1)
    }
  }

  // within a register
  for (i <- 0 to (n - 1)) {
    for (j <- 1 to (dataWidth.value - 1)) {
      mem(i)(j) := mem(i)(j - 1)
    }
  }

  when((~(startOfInnerLoop && startOfOuterLoop)) && slideCounter.willOverflow) {
    // store the remainder except when the algorithm starts
    // when() {
    // mem(n) := U(0xff).resized
    mem(n) := div2.io.remainder
    // }
  } otherwise {
    mem(n)(0) := mem(0)(dataWidth.value - 1)
    for (j <- 1 to (dataWidth.value - 1)) {
      mem(n)(j) := mem(n)(j - 1)
    }
  }

  // when(slideCounter.willOverflow) {
  //   for (i <- 1 to n) {
  //     mem(i - 1) := mem(i)
  //   }
  // }

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
