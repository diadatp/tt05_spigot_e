package spigot_e

import spinal.core._
import spinal.core.sim._
import spinal.lib._
import spinal.lib.fsm._
import spinal.lib.sim._

case class AddressSequencer(n: Int) extends Component {
  val io = new Bundle {
    val readReq = master Stream (UInt(log2Up(n + 1) bits))
  }

  // outer loop runs (n - 1) times from (n - 2) to 0
  val outerCounter = Reg(UInt(log2Up(n - 1) bits)) init (0)

  // inner loop runs (n + 1) times from n to 0
  val innerCounter = Reg(UInt(log2Up(n + 1) bits)) init (0)

  val valid = Reg(Bool) init (False)

  io.readReq.valid := valid
  io.readReq.payload := innerCounter

  val fsm: StateMachine = new StateMachine {
    val stateInit: State = new State with EntryPoint {
      whenIsActive {
        outerCounter := n - 2
        innerCounter := n
        valid := True
        goto(stateDo)
      }
    }

    val stateDo: State = new State {
      whenIsActive {
        when(io.readReq.ready) {
          when(innerCounter === 0) {
            when(outerCounter === 0) {
              valid := False
            } otherwise {
              innerCounter := n
              outerCounter := outerCounter - 1
            }
          } otherwise {
            innerCounter := innerCounter - 1
          }
        }
      }
    }
  }

  assert(
    assertion = !(io.readReq.valid.fall && !io.readReq.ready),
    message = "Valid dropped when ready was low",
    severity = ERROR
  )
}

object AddressSequencerVerilog extends App {
  Config.spinal.generateVerilog(AddressSequencer(9))
}

object AddressSequencerSim extends App {

  val n: Int = 9

  val dut = SimConfig.withWave.compile(AddressSequencer(n))

  dut.doSim("simple test") { dut =>
    StreamReadyRandomizer(dut.io.readReq, dut.clockDomain)

    dut.clockDomain.forkStimulus(10)

    StreamMonitor(dut.io.readReq, dut.clockDomain) { payload =>
      print(payload.toInt)
    }

    var count = n
    val scoreboard = ScoreboardInOrder[Int]()
    StreamMonitor(dut.io.readReq, dut.clockDomain) { payload =>
      scoreboard.pushDut(payload.toInt)
      scoreboard.pushRef(count)
      if (count == 0) {
        count = n
      } else {
        count = count - 1
      }
    }

    for (idx <- 0 to 500) {
      dut.clockDomain.waitRisingEdge()
    }
  }
}
