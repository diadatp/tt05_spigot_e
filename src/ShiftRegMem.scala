package spigot_e

import spinal.core._
import spinal.lib.fsm._
import spinal.lib._

case class ShiftRegMem(width: Int = 8, depth: Int = 11, stride: Int = 1) extends Component {
  val io = new Bundle {
    val readReq = slave Stream (UInt(log2Up(depth) bits))
    val readRes = master Stream (UInt(width bits))
    val writeReq = slave Stream (Vec(UInt(log2Up(depth) bits), UInt(width bits)))
  }

  val shiftCounter = CounterFreeRun(width)
  val addrCounter = Counter(depth)

  // val readAddrCounter = Reg(UInt(log2Up(depth) bits)) init (stride)
  val writeAddrCounter = Reg(UInt(log2Up(depth) bits)) init (stride + 1)

  when(shiftCounter.willOverflow) {
    addrCounter.increment()
    when(writeAddrCounter === U(depth - 1)) {
      writeAddrCounter := 0
    } otherwise {
      writeAddrCounter := writeAddrCounter + 1
    }
  }

  val mem = Vec(Reg(UInt(width bits)) init (0), depth)

  mem(depth - 1)(width - 1) := mem(0)(0)
  for (i <- 0 to (depth - 1)) {
    if (i > 0) {
      mem(i - 1)(width - 1) := mem(i)(0)
    }
    for (j <- 1 to (width - 1)) {
      mem(i)(j - 1) := mem(i)(j)
    }
  }

  io.writeReq.ready := False

  when(io.writeReq.valid) {
    when(shiftCounter.willOverflow) {
      when(io.writeReq.payload(0) === writeAddrCounter) {
        io.writeReq.ready := True
        mem(stride) := io.writeReq.payload(1)
      }
    }
  }

  io.readReq.ready := False
  io.readRes.valid := False
  io.readRes.payload := 0

  when(io.readReq.valid) {
    when(shiftCounter.value === 0) {
      when(io.readReq.payload === addrCounter.value) {
        when(io.readRes.ready) {
          io.readRes.valid := True
          io.readRes.payload := mem(0)
          io.readReq.ready := True
        }
      }
    }
  }

  assert(
    assertion = !(io.readRes.valid.fall && !io.readRes.ready),
    message = "Valid dropped when ready was low",
    severity = ERROR
  )
}

object ShiftRegMemVerilog extends App {
  Config.spinal.generateVerilog(ShiftRegMem())
}

case class ReadPort(addrWidth: BitCount, dataWidth: BitCount) extends Bundle with IMasterSlave {
  val addr = UInt(addrWidth)
  val data = UInt(dataWidth)

  override def asMaster(): Unit = {
    in(addr)
    out(data)
  }
}

case class WritePort(addrWidth: BitCount, dataWidth: BitCount) extends Bundle with IMasterSlave {
  val addr = UInt(addrWidth)
  val data = UInt(dataWidth)

  override def asMaster(): Unit = {
    in(addr, data)
  }
}

import spinal.core.sim._
import spinal.lib.sim.{StreamMonitor, StreamDriver, StreamReadyRandomizer, ScoreboardInOrder}

object ShiftRegMemSim extends App {
  val dut = SimConfig.withWave.compile(ShiftRegMem())

  dut.doSim("simple test") { dut =>
    val scoreboard = ScoreboardInOrder[Int]()

    // drive random data and add pushed data to scoreboard
    StreamDriver(dut.io.readReq, dut.clockDomain) { payload =>
      payload.randomize()
      true
    }

    StreamDriver(dut.io.writeReq, dut.clockDomain) { payload =>
      payload.randomize()
      true
    }

    StreamMonitor(dut.io.readReq, dut.clockDomain) { payload =>
      // scoreboard.pushRef(payload.toInt)
      scoreboard.pushRef(0)
    }

    // randmize ready on the output and add popped data to scoreboard
    StreamReadyRandomizer(dut.io.readRes, dut.clockDomain)
    StreamMonitor(dut.io.readRes, dut.clockDomain) { payload =>
      scoreboard.pushDut(payload.toInt)
    }

    dut.clockDomain.forkStimulus(10)

    // dut.clockDomain.waitActiveEdgeWhere(scoreboard.matches == 100)
    for (idx <- 0 to 1000) {
      dut.clockDomain.waitRisingEdge()
    }
  }
}
