// Generator : SpinalHDL v1.9.3    git head : 029104c77a54c53f1edda327a3bea333f7d65fd9
// Component : TopModule
// Git hash  : d0b56cff8d0a2fbbaf3b537217f59cea5ec5381d

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
  localparam outerFsm_enumDef_BOOT = 3'd0;
  localparam outerFsm_enumDef_stateInit = 3'd1;
  localparam outerFsm_enumDef_stateMulTen = 3'd2;
  localparam outerFsm_enumDef_stateDivideAndPropagate = 3'd3;
  localparam outerFsm_enumDef_stateFinish = 3'd4;

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
  wire                outerFsm_wantExit;
  reg                 outerFsm_wantStart;
  wire                outerFsm_wantKill;
  reg        [3:0]    outerFsm_outerCounter;
  reg        [3:0]    outerFsm_innerCounter;
  reg        [2:0]    outerFsm_stateReg;
  reg        [2:0]    outerFsm_stateNext;
  wire                _zz_when_StateMachine_l237;
  wire                _zz_when_StateMachine_l237_1;
  wire                when_TopModule_l35;
  wire                when_TopModule_l48;
  wire       [3:0]    _zz_digits_0;
  wire       [7:0]    _zz_digits_0_1;
  wire       [7:0]    _zz_digits_0_2;
  wire                when_TopModule_l64;
  wire                when_TopModule_l69;
  wire       [3:0]    _zz_12;
  wire                when_StateMachine_l237;
  wire                when_StateMachine_l253;
  wire                when_StateMachine_l253_1;
  wire                when_StateMachine_l253_2;
  `ifndef SYNTHESIS
  reg [183:0] outerFsm_stateReg_string;
  reg [183:0] outerFsm_stateNext_string;
  `endif

  (* ram_style = "distributed" *) reg [7:0] mem [0:12];

  assign _zz_mem_port_2 = (4'b1010 * _zz_mem_port1);
  assign _zz_mem_port_5 = (_zz_digits_0_1 % _zz_digits_0);
  assign _zz_mem_port_4 = {4'd0, _zz_mem_port_5};
  assign _zz_mem_port_6 = (outerFsm_innerCounter - 4'b0001);
  assign _zz_mem_port_8 = (_zz_mem_port5 + _zz_digits_0_2);
  assign _zz__zz_digits_0_2 = (_zz_digits_0_1 / _zz_digits_0);
  assign _zz_mem_port = 8'h01;
  assign _zz_mem_port_1 = _zz_mem_port_2[7 : 0];
  assign _zz_mem_port_3 = _zz_mem_port_4;
  assign _zz_mem_port_7 = _zz_mem_port_8;
  always @(posedge clk) begin
    if(_zz_4) begin
      mem[outerFsm_innerCounter] <= _zz_mem_port;
    end
  end

  assign _zz_mem_port1 = mem[outerFsm_innerCounter];
  always @(posedge clk) begin
    if(_zz_3) begin
      mem[outerFsm_innerCounter] <= _zz_mem_port_1;
    end
  end

  assign _zz_mem_port3 = mem[outerFsm_innerCounter];
  always @(posedge clk) begin
    if(_zz_2) begin
      mem[outerFsm_innerCounter] <= _zz_mem_port_3;
    end
  end

  assign _zz_mem_port5 = mem[_zz_12];
  always @(posedge clk) begin
    if(_zz_1) begin
      mem[_zz_mem_port_6] <= _zz_mem_port_7;
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(outerFsm_stateReg)
      outerFsm_enumDef_BOOT : outerFsm_stateReg_string = "BOOT                   ";
      outerFsm_enumDef_stateInit : outerFsm_stateReg_string = "stateInit              ";
      outerFsm_enumDef_stateMulTen : outerFsm_stateReg_string = "stateMulTen            ";
      outerFsm_enumDef_stateDivideAndPropagate : outerFsm_stateReg_string = "stateDivideAndPropagate";
      outerFsm_enumDef_stateFinish : outerFsm_stateReg_string = "stateFinish            ";
      default : outerFsm_stateReg_string = "???????????????????????";
    endcase
  end
  always @(*) begin
    case(outerFsm_stateNext)
      outerFsm_enumDef_BOOT : outerFsm_stateNext_string = "BOOT                   ";
      outerFsm_enumDef_stateInit : outerFsm_stateNext_string = "stateInit              ";
      outerFsm_enumDef_stateMulTen : outerFsm_stateNext_string = "stateMulTen            ";
      outerFsm_enumDef_stateDivideAndPropagate : outerFsm_stateNext_string = "stateDivideAndPropagate";
      outerFsm_enumDef_stateFinish : outerFsm_stateNext_string = "stateFinish            ";
      default : outerFsm_stateNext_string = "???????????????????????";
    endcase
  end
  `endif

  always @(*) begin
    _zz_1 = 1'b0;
    case(outerFsm_stateReg)
      outerFsm_enumDef_stateInit : begin
      end
      outerFsm_enumDef_stateMulTen : begin
      end
      outerFsm_enumDef_stateDivideAndPropagate : begin
        if(!when_TopModule_l64) begin
          _zz_1 = 1'b1;
        end
      end
      outerFsm_enumDef_stateFinish : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_2 = 1'b0;
    case(outerFsm_stateReg)
      outerFsm_enumDef_stateInit : begin
      end
      outerFsm_enumDef_stateMulTen : begin
      end
      outerFsm_enumDef_stateDivideAndPropagate : begin
        _zz_2 = 1'b1;
      end
      outerFsm_enumDef_stateFinish : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_3 = 1'b0;
    case(outerFsm_stateReg)
      outerFsm_enumDef_stateInit : begin
      end
      outerFsm_enumDef_stateMulTen : begin
        _zz_3 = 1'b1;
      end
      outerFsm_enumDef_stateDivideAndPropagate : begin
      end
      outerFsm_enumDef_stateFinish : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    _zz_4 = 1'b0;
    case(outerFsm_stateReg)
      outerFsm_enumDef_stateInit : begin
        _zz_4 = 1'b1;
      end
      outerFsm_enumDef_stateMulTen : begin
      end
      outerFsm_enumDef_stateDivideAndPropagate : begin
      end
      outerFsm_enumDef_stateFinish : begin
      end
      default : begin
      end
    endcase
  end

  assign outerFsm_wantExit = 1'b0;
  always @(*) begin
    outerFsm_wantStart = 1'b0;
    case(outerFsm_stateReg)
      outerFsm_enumDef_stateInit : begin
      end
      outerFsm_enumDef_stateMulTen : begin
      end
      outerFsm_enumDef_stateDivideAndPropagate : begin
      end
      outerFsm_enumDef_stateFinish : begin
      end
      default : begin
        outerFsm_wantStart = 1'b1;
      end
    endcase
  end

  assign outerFsm_wantKill = 1'b0;
  assign io_digit0 = digits_0;
  assign io_digit1 = digits_1;
  assign io_digit2 = digits_2;
  assign io_digit3 = digits_3;
  assign _zz_when_StateMachine_l237 = (outerFsm_stateReg == outerFsm_enumDef_stateInit);
  assign _zz_when_StateMachine_l237_1 = (outerFsm_stateNext == outerFsm_enumDef_stateInit);
  always @(*) begin
    outerFsm_stateNext = outerFsm_stateReg;
    case(outerFsm_stateReg)
      outerFsm_enumDef_stateInit : begin
        if(when_TopModule_l35) begin
          outerFsm_stateNext = outerFsm_enumDef_stateMulTen;
        end
      end
      outerFsm_enumDef_stateMulTen : begin
        if(when_TopModule_l48) begin
          outerFsm_stateNext = outerFsm_enumDef_stateDivideAndPropagate;
        end
      end
      outerFsm_enumDef_stateDivideAndPropagate : begin
        if(when_TopModule_l64) begin
          if(when_TopModule_l69) begin
            outerFsm_stateNext = outerFsm_enumDef_stateFinish;
          end else begin
            outerFsm_stateNext = outerFsm_enumDef_stateMulTen;
          end
        end
      end
      outerFsm_enumDef_stateFinish : begin
      end
      default : begin
      end
    endcase
    if(outerFsm_wantStart) begin
      outerFsm_stateNext = outerFsm_enumDef_stateInit;
    end
    if(outerFsm_wantKill) begin
      outerFsm_stateNext = outerFsm_enumDef_BOOT;
    end
  end

  assign when_TopModule_l35 = (outerFsm_innerCounter == 4'b0000);
  assign when_TopModule_l48 = (outerFsm_innerCounter == 4'b0000);
  assign _zz_digits_0 = (outerFsm_innerCounter + 4'b0010);
  assign _zz_digits_0_1 = _zz_mem_port3;
  assign _zz_digits_0_2 = _zz__zz_digits_0_2;
  assign when_TopModule_l64 = (outerFsm_innerCounter == 4'b0000);
  assign when_TopModule_l69 = (outerFsm_outerCounter == 4'b0000);
  assign _zz_12 = (outerFsm_innerCounter - 4'b0001);
  assign when_StateMachine_l237 = (_zz_when_StateMachine_l237 && (! _zz_when_StateMachine_l237_1));
  assign when_StateMachine_l253 = ((! _zz_when_StateMachine_l237) && _zz_when_StateMachine_l237_1);
  assign when_StateMachine_l253_1 = ((! (outerFsm_stateReg == outerFsm_enumDef_stateMulTen)) && (outerFsm_stateNext == outerFsm_enumDef_stateMulTen));
  assign when_StateMachine_l253_2 = ((! (outerFsm_stateReg == outerFsm_enumDef_stateDivideAndPropagate)) && (outerFsm_stateNext == outerFsm_enumDef_stateDivideAndPropagate));
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      digits_0 <= 4'b0000;
      digits_1 <= 4'b0000;
      digits_2 <= 4'b0000;
      digits_3 <= 4'b0000;
      outerFsm_outerCounter <= 4'b0000;
      outerFsm_innerCounter <= 4'b0000;
      outerFsm_stateReg <= outerFsm_enumDef_BOOT;
    end else begin
      outerFsm_stateReg <= outerFsm_stateNext;
      case(outerFsm_stateReg)
        outerFsm_enumDef_stateInit : begin
          if(!when_TopModule_l35) begin
            outerFsm_innerCounter <= (outerFsm_innerCounter - 4'b0001);
          end
        end
        outerFsm_enumDef_stateMulTen : begin
          if(!when_TopModule_l48) begin
            outerFsm_innerCounter <= (outerFsm_innerCounter - 4'b0001);
          end
        end
        outerFsm_enumDef_stateDivideAndPropagate : begin
          if(when_TopModule_l64) begin
            digits_0 <= _zz_digits_0_2[3:0];
            digits_1 <= digits_0;
            digits_2 <= digits_1;
            digits_3 <= digits_2;
            if(!when_TopModule_l69) begin
              outerFsm_outerCounter <= (outerFsm_outerCounter - 4'b0001);
            end
          end else begin
            outerFsm_innerCounter <= (outerFsm_innerCounter - 4'b0001);
          end
        end
        outerFsm_enumDef_stateFinish : begin
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l237) begin
        digits_0 <= 4'b0010;
      end
      if(when_StateMachine_l253) begin
        outerFsm_innerCounter <= 4'b1100;
        outerFsm_outerCounter <= 4'b1010;
      end
      if(when_StateMachine_l253_1) begin
        outerFsm_innerCounter <= 4'b1100;
      end
      if(when_StateMachine_l253_2) begin
        outerFsm_innerCounter <= 4'b1100;
      end
    end
  end


endmodule
