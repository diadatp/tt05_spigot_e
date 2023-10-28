// Generator : SpinalHDL v1.9.3    git head : 029104c77a54c53f1edda327a3bea333f7d65fd9
// Component : TopModule
// Git hash  : 722bc85e433979ef04a121fa7def930368be39a4

`timescale 1ns/1ps

module TopModule (
  input               io_ena,
  output     [3:0]    io_digit0,
  output     [3:0]    io_digit1,
  output     [3:0]    io_digit2,
  output     [3:0]    io_digit3,
  input               clk,
  input               resetn
);
  localparam StateMachineEnum_ = 2'd0;
  localparam StateMachineEnum__1 = 2'd1;
  localparam StateMachineEnum__2 = 2'd2;
  localparam StateMachineEnum__3 = 2'd3;

  wire       [7:0]    _zz_mem_port;
  reg                 _zz_1;
  reg        [3:0]    digits_0;
  reg        [3:0]    digits_1;
  reg        [3:0]    digits_2;
  reg        [3:0]    digits_3;
  reg                 _zz_2;
  reg        [2:0]    _zz_when_TopModule_l48;
  reg        [3:0]    _zz_when_TopModule_l31;
  reg        [1:0]    _zz_when_StateMachine_l253;
  reg        [1:0]    _zz_when_StateMachine_l253_1;
  wire                when_TopModule_l31;
  wire                when_TopModule_l48;
  wire                when_StateMachine_l253;
  wire                when_StateMachine_l253_1;
  `ifndef SYNTHESIS
  reg [15:0] _zz_when_StateMachine_l253_string;
  reg [15:0] _zz_when_StateMachine_l253_1_string;
  `endif

  reg [7:0] mem [0:9];

  assign _zz_mem_port = 8'h01;
  always @(posedge clk) begin
    if(_zz_1) begin
      mem[_zz_when_TopModule_l31] <= _zz_mem_port;
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_when_StateMachine_l253)
      StateMachineEnum_ : _zz_when_StateMachine_l253_string = "  ";
      StateMachineEnum__1 : _zz_when_StateMachine_l253_string = "_1";
      StateMachineEnum__2 : _zz_when_StateMachine_l253_string = "_2";
      StateMachineEnum__3 : _zz_when_StateMachine_l253_string = "_3";
      default : _zz_when_StateMachine_l253_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_when_StateMachine_l253_1)
      StateMachineEnum_ : _zz_when_StateMachine_l253_1_string = "  ";
      StateMachineEnum__1 : _zz_when_StateMachine_l253_1_string = "_1";
      StateMachineEnum__2 : _zz_when_StateMachine_l253_1_string = "_2";
      StateMachineEnum__3 : _zz_when_StateMachine_l253_1_string = "_3";
      default : _zz_when_StateMachine_l253_1_string = "??";
    endcase
  end
  `endif

  always @(*) begin
    _zz_1 = 1'b0;
    if(io_ena) begin
      case(_zz_when_StateMachine_l253)
        StateMachineEnum__1 : begin
          _zz_1 = 1'b1;
        end
        StateMachineEnum__2 : begin
        end
        StateMachineEnum__3 : begin
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    case(_zz_when_StateMachine_l253)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
      end
      default : begin
        _zz_2 = 1'b1;
      end
    endcase
  end

  always @(*) begin
    _zz_when_StateMachine_l253_1 = _zz_when_StateMachine_l253;
    case(_zz_when_StateMachine_l253)
      StateMachineEnum__1 : begin
        if(when_TopModule_l31) begin
          _zz_when_StateMachine_l253_1 = StateMachineEnum__2;
        end
      end
      StateMachineEnum__2 : begin
        if(when_TopModule_l48) begin
          _zz_when_StateMachine_l253_1 = StateMachineEnum__3;
        end
      end
      StateMachineEnum__3 : begin
      end
      default : begin
      end
    endcase
    if(_zz_2) begin
      _zz_when_StateMachine_l253_1 = StateMachineEnum__1;
    end
    if(1'b0) begin
      _zz_when_StateMachine_l253_1 = StateMachineEnum_;
    end
  end

  assign when_TopModule_l31 = (_zz_when_TopModule_l31 == 4'b0000);
  assign when_TopModule_l48 = (_zz_when_TopModule_l48 == 3'b000);
  assign when_StateMachine_l253 = ((! (_zz_when_StateMachine_l253 == StateMachineEnum__1)) && (_zz_when_StateMachine_l253_1 == StateMachineEnum__1));
  assign when_StateMachine_l253_1 = ((! (_zz_when_StateMachine_l253 == StateMachineEnum__2)) && (_zz_when_StateMachine_l253_1 == StateMachineEnum__2));
  assign io_digit0 = digits_0;
  assign io_digit1 = digits_1;
  assign io_digit2 = digits_2;
  assign io_digit3 = digits_3;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      digits_0 <= 4'b0000;
      digits_1 <= 4'b0000;
      digits_2 <= 4'b0000;
      digits_3 <= 4'b0000;
    end else begin
      if(io_ena) begin
        case(_zz_when_StateMachine_l253)
          StateMachineEnum__1 : begin
          end
          StateMachineEnum__2 : begin
            digits_0 <= 4'b0010;
            digits_1 <= digits_0;
            digits_2 <= digits_1;
            digits_3 <= digits_2;
          end
          StateMachineEnum__3 : begin
          end
          default : begin
          end
        endcase
      end
    end
  end

  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      _zz_when_TopModule_l48 <= 3'b000;
      _zz_when_TopModule_l31 <= 4'b0000;
      _zz_when_StateMachine_l253 <= StateMachineEnum_;
    end else begin
      _zz_when_StateMachine_l253 <= _zz_when_StateMachine_l253_1;
      case(_zz_when_StateMachine_l253)
        StateMachineEnum__1 : begin
          if(!when_TopModule_l31) begin
            _zz_when_TopModule_l31 <= (_zz_when_TopModule_l31 - 4'b0001);
          end
        end
        StateMachineEnum__2 : begin
          if(!when_TopModule_l48) begin
            _zz_when_TopModule_l48 <= (_zz_when_TopModule_l48 - 3'b001);
          end
        end
        StateMachineEnum__3 : begin
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l253) begin
        _zz_when_TopModule_l31 <= 4'b1001;
      end
      if(when_StateMachine_l253_1) begin
        _zz_when_TopModule_l48 <= 3'b111;
      end
    end
  end


endmodule
