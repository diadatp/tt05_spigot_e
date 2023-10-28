// Generator : SpinalHDL v1.9.3    git head : 029104c77a54c53f1edda327a3bea333f7d65fd9
// Component : TopModule
// Git hash  : d8f38338f666c131e4e843c4a58c86831a60e5ca

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
  localparam StateMachineEnum_ = 3'd0;
  localparam StateMachineEnum__1 = 3'd1;
  localparam StateMachineEnum__2 = 3'd2;
  localparam StateMachineEnum__3 = 3'd3;
  localparam StateMachineEnum__4 = 3'd4;

  wire       [7:0]    _zz_mem_port1;
  wire       [7:0]    _zz_mem_port3;
  wire       [7:0]    _zz_mem_port5;
  wire       [7:0]    _zz_mem_port;
  wire       [7:0]    _zz_mem_port_1;
  wire       [11:0]   _zz_mem_port_2;
  wire       [7:0]    _zz_mem_port_3;
  wire       [7:0]    _zz_mem_port_4;
  wire       [3:0]    _zz_mem_port_5;
  wire       [3:0]    _zz_mem_port_6;
  wire       [7:0]    _zz_mem_port_7;
  wire       [7:0]    _zz_mem_port_8;
  wire       [7:0]    _zz__zz_digits_0_2;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 _zz_3;
  reg                 _zz_4;
  reg        [3:0]    digits_0;
  reg        [3:0]    digits_1;
  reg        [3:0]    digits_2;
  reg        [3:0]    digits_3;
  reg                 _zz_5;
  reg        [2:0]    _zz_when_TopModule_l69;
  reg        [3:0]    _zz_when_TopModule_l35;
  reg        [2:0]    _zz_when_StateMachine_l253;
  reg        [2:0]    _zz_when_StateMachine_l253_1;
  wire                _zz_when_StateMachine_l237;
  wire                _zz_when_StateMachine_l237_1;
  wire                when_TopModule_l35;
  wire                when_TopModule_l48;
  wire       [3:0]    _zz_digits_0;
  wire       [7:0]    _zz_digits_0_1;
  wire       [7:0]    _zz_digits_0_2;
  wire                when_TopModule_l64;
  wire                when_TopModule_l69;
  wire       [3:0]    _zz_13;
  wire                when_StateMachine_l237;
  wire                when_StateMachine_l253;
  wire                when_StateMachine_l253_1;
  wire                when_StateMachine_l253_2;
  `ifndef SYNTHESIS
  reg [15:0] _zz_when_StateMachine_l253_string;
  reg [15:0] _zz_when_StateMachine_l253_1_string;
  `endif

  (* ram_style = "distributed" *) reg [7:0] mem [0:9];

  assign _zz_mem_port_2 = (4'b1010 * _zz_mem_port1);
  assign _zz_mem_port_5 = (_zz_digits_0_1 % _zz_digits_0);
  assign _zz_mem_port_4 = {4'd0, _zz_mem_port_5};
  assign _zz_mem_port_6 = (_zz_when_TopModule_l35 - 4'b0001);
  assign _zz_mem_port_8 = (_zz_mem_port5 + _zz_digits_0_2);
  assign _zz__zz_digits_0_2 = (_zz_digits_0_1 / _zz_digits_0);
  assign _zz_mem_port = 8'h01;
  assign _zz_mem_port_1 = _zz_mem_port_2[7 : 0];
  assign _zz_mem_port_3 = _zz_mem_port_4;
  assign _zz_mem_port_7 = _zz_mem_port_8;
  always @(posedge clk) begin
    if(_zz_4) begin
      mem[_zz_when_TopModule_l35] <= _zz_mem_port;
    end
  end

  assign _zz_mem_port1 = mem[_zz_when_TopModule_l35];
  always @(posedge clk) begin
    if(_zz_3) begin
      mem[_zz_when_TopModule_l35] <= _zz_mem_port_1;
    end
  end

  assign _zz_mem_port3 = mem[_zz_when_TopModule_l35];
  always @(posedge clk) begin
    if(_zz_2) begin
      mem[_zz_when_TopModule_l35] <= _zz_mem_port_3;
    end
  end

  assign _zz_mem_port5 = mem[_zz_13];
  always @(posedge clk) begin
    if(_zz_1) begin
      mem[_zz_mem_port_6] <= _zz_mem_port_7;
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_when_StateMachine_l253)
      StateMachineEnum_ : _zz_when_StateMachine_l253_string = "  ";
      StateMachineEnum__1 : _zz_when_StateMachine_l253_string = "_1";
      StateMachineEnum__2 : _zz_when_StateMachine_l253_string = "_2";
      StateMachineEnum__3 : _zz_when_StateMachine_l253_string = "_3";
      StateMachineEnum__4 : _zz_when_StateMachine_l253_string = "_4";
      default : _zz_when_StateMachine_l253_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_when_StateMachine_l253_1)
      StateMachineEnum_ : _zz_when_StateMachine_l253_1_string = "  ";
      StateMachineEnum__1 : _zz_when_StateMachine_l253_1_string = "_1";
      StateMachineEnum__2 : _zz_when_StateMachine_l253_1_string = "_2";
      StateMachineEnum__3 : _zz_when_StateMachine_l253_1_string = "_3";
      StateMachineEnum__4 : _zz_when_StateMachine_l253_1_string = "_4";
      default : _zz_when_StateMachine_l253_1_string = "??";
    endcase
  end
  `endif

  always @(*) begin
    _zz_1 = 1'b0;
    case(_zz_when_StateMachine_l253)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
        if(!when_TopModule_l64) begin
          _zz_1 = 1'b1;
        end
      end
      StateMachineEnum__4 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_2 = 1'b0;
    case(_zz_when_StateMachine_l253)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
        _zz_2 = 1'b1;
      end
      StateMachineEnum__4 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_3 = 1'b0;
    case(_zz_when_StateMachine_l253)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
        _zz_3 = 1'b1;
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_4 = 1'b0;
    case(_zz_when_StateMachine_l253)
      StateMachineEnum__1 : begin
        _zz_4 = 1'b1;
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_5 = 1'b0;
    case(_zz_when_StateMachine_l253)
      StateMachineEnum__1 : begin
      end
      StateMachineEnum__2 : begin
      end
      StateMachineEnum__3 : begin
      end
      StateMachineEnum__4 : begin
      end
      default : begin
        _zz_5 = 1'b1;
      end
    endcase
  end

  assign io_digit0 = digits_0;
  assign io_digit1 = digits_1;
  assign io_digit2 = digits_2;
  assign io_digit3 = digits_3;
  assign _zz_when_StateMachine_l237 = (_zz_when_StateMachine_l253 == StateMachineEnum__1);
  assign _zz_when_StateMachine_l237_1 = (_zz_when_StateMachine_l253_1 == StateMachineEnum__1);
  always @(*) begin
    _zz_when_StateMachine_l253_1 = _zz_when_StateMachine_l253;
    case(_zz_when_StateMachine_l253)
      StateMachineEnum__1 : begin
        if(when_TopModule_l35) begin
          _zz_when_StateMachine_l253_1 = StateMachineEnum__2;
        end
      end
      StateMachineEnum__2 : begin
        if(when_TopModule_l48) begin
          _zz_when_StateMachine_l253_1 = StateMachineEnum__3;
        end
      end
      StateMachineEnum__3 : begin
        if(when_TopModule_l64) begin
          if(when_TopModule_l69) begin
            _zz_when_StateMachine_l253_1 = StateMachineEnum__4;
          end else begin
            _zz_when_StateMachine_l253_1 = StateMachineEnum__2;
          end
        end
      end
      StateMachineEnum__4 : begin
      end
      default : begin
      end
    endcase
    if(_zz_5) begin
      _zz_when_StateMachine_l253_1 = StateMachineEnum__1;
    end
    if(1'b0) begin
      _zz_when_StateMachine_l253_1 = StateMachineEnum_;
    end
  end

  assign when_TopModule_l35 = (_zz_when_TopModule_l35 == 4'b0000);
  assign when_TopModule_l48 = (_zz_when_TopModule_l35 == 4'b0000);
  assign _zz_digits_0 = (_zz_when_TopModule_l35 + 4'b0010);
  assign _zz_digits_0_1 = _zz_mem_port3;
  assign _zz_digits_0_2 = _zz__zz_digits_0_2;
  assign when_TopModule_l64 = (_zz_when_TopModule_l35 == 4'b0000);
  assign when_TopModule_l69 = (_zz_when_TopModule_l69 == 3'b000);
  assign _zz_13 = (_zz_when_TopModule_l35 - 4'b0001);
  assign when_StateMachine_l237 = (_zz_when_StateMachine_l237 && (! _zz_when_StateMachine_l237_1));
  assign when_StateMachine_l253 = ((! _zz_when_StateMachine_l237) && _zz_when_StateMachine_l237_1);
  assign when_StateMachine_l253_1 = ((! (_zz_when_StateMachine_l253 == StateMachineEnum__2)) && (_zz_when_StateMachine_l253_1 == StateMachineEnum__2));
  assign when_StateMachine_l253_2 = ((! (_zz_when_StateMachine_l253 == StateMachineEnum__3)) && (_zz_when_StateMachine_l253_1 == StateMachineEnum__3));
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      digits_0 <= 4'b0000;
      digits_1 <= 4'b0000;
      digits_2 <= 4'b0000;
      digits_3 <= 4'b0000;
      _zz_when_TopModule_l69 <= 3'b000;
      _zz_when_TopModule_l35 <= 4'b0000;
      _zz_when_StateMachine_l253 <= StateMachineEnum_;
    end else begin
      _zz_when_StateMachine_l253 <= _zz_when_StateMachine_l253_1;
      case(_zz_when_StateMachine_l253)
        StateMachineEnum__1 : begin
          if(!when_TopModule_l35) begin
            _zz_when_TopModule_l35 <= (_zz_when_TopModule_l35 - 4'b0001);
          end
        end
        StateMachineEnum__2 : begin
          if(!when_TopModule_l48) begin
            _zz_when_TopModule_l35 <= (_zz_when_TopModule_l35 - 4'b0001);
          end
        end
        StateMachineEnum__3 : begin
          if(when_TopModule_l64) begin
            digits_0 <= _zz_digits_0_2[3:0];
            digits_1 <= digits_0;
            digits_2 <= digits_1;
            digits_3 <= digits_2;
            if(!when_TopModule_l69) begin
              _zz_when_TopModule_l69 <= (_zz_when_TopModule_l69 - 3'b001);
            end
          end else begin
            _zz_when_TopModule_l35 <= (_zz_when_TopModule_l35 - 4'b0001);
          end
        end
        StateMachineEnum__4 : begin
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l237) begin
        digits_0 <= 4'b0010;
      end
      if(when_StateMachine_l253) begin
        _zz_when_TopModule_l35 <= 4'b1001;
        _zz_when_TopModule_l69 <= 3'b111;
      end
      if(when_StateMachine_l253_1) begin
        _zz_when_TopModule_l35 <= 4'b1001;
      end
      if(when_StateMachine_l253_2) begin
        _zz_when_TopModule_l35 <= 4'b1001;
      end
    end
  end


endmodule
