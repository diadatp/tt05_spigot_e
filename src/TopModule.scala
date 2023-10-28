package spigot_e

import spinal.core._
import spinal.lib.fsm._

case class TopModule(n: Int) extends Component {
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
  {
    val outerFsm = new StateMachine {
      // outer loop runs (n - 1) times from 0 to (n - 2)
      val outerCounter = Reg(UInt(log2Up(n - 2) bits)) init (0)
      // inner loop runs (n + 1) times from 0 to n
      val innerCounter = Reg(UInt(log2Up(n) bits)) init (0)

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
            goto(stateDivideAndPropagate)
          } otherwise {
            innerCounter := innerCounter - 1
          }
        }
      }

      val stateDivideAndPropagate: State = new State {
        onEntry(innerCounter := n)
        whenIsActive {
          val divisor = (innerCounter + 2)
          val dividend = mem.readAsync(innerCounter)
          val quotient = (dividend / divisor).resize(8)
          val remainder = (dividend % divisor).resize(8)
          mem.write(innerCounter, remainder)
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
            mem.write(innerCounter - 1, (mem.readAsync(innerCounter - 1) + quotient))
            innerCounter := innerCounter - 1
          }
        }
      }

      val stateFinish: State = new State
    }
  }

  io.digit0 := digits(0)
  io.digit1 := digits(1)
  io.digit2 := digits(2)
  io.digit3 := digits(3)
}

object TopModuleVerilog extends App {
  Config.spinal.generateVerilog(TopModule(12))
}
