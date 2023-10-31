package spigot_e

import spinal.core._
import spinal.lib.fsm._

case class TopModule(n: Int, dataWidth: BitCount = 8 bits) extends Component {
  val io = new Bundle {
    val ena = in Bool ()
    val digit0 = out UInt (4 bits)
    val digit1 = out UInt (4 bits)
    val digit2 = out UInt (4 bits)
    val digit3 = out UInt (4 bits)
  }

  val digits = Vec.fill(4)(Reg(UInt(4 bits)) init (0))

  val mem = Mem(wordType = UInt(8 bits), wordCount = (n + 1))

  // when(io.ena) {
  // {
  val outerFsm = new StateMachine {
    // outer loop runs (n - 1) times from 0 to (n - 2)
    val outerCounter = Reg(UInt(log2Up(n - 1) bits)) init (0)
    // inner loop runs (n + 1) times from 0 to n
    val innerCounter = Reg(UInt(log2Up(n + 1) bits)) init (0)

    // divisor goes from 2 to (n + 2)
    val divisor = Reg(UInt(log2Up(n + 3) bits)) init (0)
    val dividend = Reg(UInt(dataWidth)) init (0)
    val divideCounter = Reg(UInt(log2Up(dividend.getWidth + 1) bits)) init (0)
    val accumulator = Reg(UInt(dataWidth + dataWidth)) init (0)
    val quotient = Reg(UInt(dataWidth)) init (0)
    val remainder = Reg(UInt(dataWidth)) init (0)

    val stateInit: State = new State with EntryPoint {
      onEntry {
        innerCounter := n
        outerCounter := (n - 2)
      }
      whenIsActive {
        mem.write(innerCounter, U(1, 8 bits))

        when(innerCounter === 0) {
          goto(stateMulTen)
        } otherwise {
          innerCounter := innerCounter - 1
        }
      }
      onExit(digits(0) := 2)
    }

    val stateMulTen: State = new State {
      onEntry(innerCounter := n)
      whenIsActive {
        mem.write(innerCounter, (10 * mem.readAsync(innerCounter))(7 downto 0))
        when(innerCounter === 0) {
          goto(stateDivideInit)
        } otherwise {
          innerCounter := innerCounter - 1
        }
      }
      onExit(innerCounter := n)
    }

    val stateDivideInit: State = new State {
      whenIsActive {
        divideCounter := dividend.getWidth
        divisor := (innerCounter + 2)
        accumulator := mem.readAsync(innerCounter).resize(dataWidth + dataWidth)
        goto(stateDivDo)
      }
    }

    val stateDivDo: State = new State {
      whenIsActive {
        when(divideCounter === 0) {
          quotient := accumulator(7 downto 0)
          remainder := accumulator(15 downto 8)
          goto(stateCommitDivide)
        } otherwise {
          divideCounter := divideCounter - 1
        }
        when(accumulator(15 downto 7) >= divisor) {
          accumulator := (accumulator(15 downto 7) - divisor) (7 downto 0) @@ accumulator(6 downto 0) @@ U(1)
        } otherwise {
          accumulator := accumulator |<< 1
        }
      }
    }

    val stateCommitDivide: State = new State {
      whenIsActive {
        innerCounter := innerCounter - 1
        mem.write(innerCounter, remainder)
        mem.write(innerCounter - 1, (mem.readAsync(innerCounter - 1) + quotient))

        when(innerCounter === 0) {
          digits(0) := quotient.resize(4 bits)
          for (i <- 1 to 3) {
            digits(i) := digits(i - 1)
          }
          when(outerCounter === 0) {
            goto(stateFinish)
          } otherwise {
            outerCounter := outerCounter - 1
            goto(stateMulTen)
          }
        } otherwise {
          goto(stateDivideInit)
        }
      }
    }

    val stateFinish: State = new State
  }
  // }

  io.digit0 := digits(0)
  io.digit1 := digits(1)
  io.digit2 := digits(2)
  io.digit3 := digits(3)
}

object TopModuleVerilog extends App {
  Config.spinal.generateVerilog(TopModule(10))
}
