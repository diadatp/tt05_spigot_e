// Generator : SpinalHDL v1.9.3    git head : 029104c77a54c53f1edda327a3bea333f7d65fd9
// Component : TopModule
// Git hash  : 55e2c1d0c1bfb32dbbe10369568b6fe31be0638a

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
  localparam outerFsm_enumDef_stateDivideInit = 3'd3;
  localparam outerFsm_enumDef_stateDivDo = 3'd4;
  localparam outerFsm_enumDef_stateCommitDivide = 3'd5;
  localparam outerFsm_enumDef_stateFinish = 3'd6;

  wire       [7:0]    _zz_mem_port1;
  wire       [7:0]    _zz_mem_port3;
  wire       [7:0]    _zz_mem_port5;
  wire       [7:0]    _zz_mem_port;
  wire       [7:0]    _zz_mem_port_1;
  wire       [11:0]   _zz_mem_port_2;
  wire       [7:0]    _zz_mem_port_3;
  wire       [3:0]    _zz_mem_port_4;
  wire       [7:0]    _zz_mem_port_5;
  wire       [7:0]    _zz_mem_port_6;
  wire       [7:0]    _zz_outerFsm_accumulator;
  wire       [8:0]    _zz_when_TopModule_l83;
  wire       [8:0]    _zz_outerFsm_accumulator_1;
  wire       [8:0]    _zz_outerFsm_accumulator_2;
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
  reg        [3:0]    outerFsm_divisor;
  wire       [7:0]    outerFsm_dividend;
  reg        [3:0]    outerFsm_divideCounter;
  reg        [15:0]   outerFsm_accumulator;
  reg        [7:0]    outerFsm_quotient;
  reg        [7:0]    outerFsm_remainder;
  reg        [2:0]    outerFsm_stateReg;
  reg        [2:0]    outerFsm_stateNext;
  wire                _zz_when_StateMachine_l237;
  wire                _zz_when_StateMachine_l237_1;
  wire                _zz_when_StateMachine_l237_2;
  wire                _zz_when_StateMachine_l237_3;
  wire                when_TopModule_l43;
  wire                when_TopModule_l56;
  wire                when_TopModule_l76;
  wire                when_TopModule_l83;
  wire       [3:0]    _zz_12;
  wire                when_TopModule_l97;
  wire                when_TopModule_l102;
  wire                when_StateMachine_l237;
  wire                when_StateMachine_l237_1;
  wire                when_StateMachine_l253;
  wire                when_StateMachine_l253_1;
  `ifndef SYNTHESIS
  reg [135:0] outerFsm_stateReg_string;
  reg [135:0] outerFsm_stateNext_string;
  `endif

  (* ram_style = "distributed" *) reg [7:0] mem [0:10];

  assign _zz_mem_port_2 = (4'b1010 * _zz_mem_port1);
  assign _zz_mem_port_4 = (outerFsm_innerCounter - 4'b0001);
  assign _zz_mem_port_6 = (_zz_mem_port5 + outerFsm_quotient);
  assign _zz_outerFsm_accumulator = _zz_mem_port3;
  assign _zz_when_TopModule_l83 = {5'd0, outerFsm_divisor};
  assign _zz_outerFsm_accumulator_1 = (outerFsm_accumulator[15 : 7] - _zz_outerFsm_accumulator_2);
  assign _zz_outerFsm_accumulator_2 = {5'd0, outerFsm_divisor};
  assign _zz_mem_port = 8'h01;
  assign _zz_mem_port_1 = _zz_mem_port_2[7 : 0];
  assign _zz_mem_port_3 = outerFsm_remainder;
  assign _zz_mem_port_5 = _zz_mem_port_6;
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
      mem[_zz_mem_port_4] <= _zz_mem_port_5;
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(outerFsm_stateReg)
      outerFsm_enumDef_BOOT : outerFsm_stateReg_string = "BOOT             ";
      outerFsm_enumDef_stateInit : outerFsm_stateReg_string = "stateInit        ";
      outerFsm_enumDef_stateMulTen : outerFsm_stateReg_string = "stateMulTen      ";
      outerFsm_enumDef_stateDivideInit : outerFsm_stateReg_string = "stateDivideInit  ";
      outerFsm_enumDef_stateDivDo : outerFsm_stateReg_string = "stateDivDo       ";
      outerFsm_enumDef_stateCommitDivide : outerFsm_stateReg_string = "stateCommitDivide";
      outerFsm_enumDef_stateFinish : outerFsm_stateReg_string = "stateFinish      ";
      default : outerFsm_stateReg_string = "?????????????????";
    endcase
  end
  always @(*) begin
    case(outerFsm_stateNext)
      outerFsm_enumDef_BOOT : outerFsm_stateNext_string = "BOOT             ";
      outerFsm_enumDef_stateInit : outerFsm_stateNext_string = "stateInit        ";
      outerFsm_enumDef_stateMulTen : outerFsm_stateNext_string = "stateMulTen      ";
      outerFsm_enumDef_stateDivideInit : outerFsm_stateNext_string = "stateDivideInit  ";
      outerFsm_enumDef_stateDivDo : outerFsm_stateNext_string = "stateDivDo       ";
      outerFsm_enumDef_stateCommitDivide : outerFsm_stateNext_string = "stateCommitDivide";
      outerFsm_enumDef_stateFinish : outerFsm_stateNext_string = "stateFinish      ";
      default : outerFsm_stateNext_string = "?????????????????";
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
      outerFsm_enumDef_stateDivideInit : begin
      end
      outerFsm_enumDef_stateDivDo : begin
      end
      outerFsm_enumDef_stateCommitDivide : begin
        _zz_1 = 1'b1;
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
      outerFsm_enumDef_stateDivideInit : begin
      end
      outerFsm_enumDef_stateDivDo : begin
      end
      outerFsm_enumDef_stateCommitDivide : begin
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
      outerFsm_enumDef_stateDivideInit : begin
      end
      outerFsm_enumDef_stateDivDo : begin
      end
      outerFsm_enumDef_stateCommitDivide : begin
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
      outerFsm_enumDef_stateDivideInit : begin
      end
      outerFsm_enumDef_stateDivDo : begin
      end
      outerFsm_enumDef_stateCommitDivide : begin
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
      outerFsm_enumDef_stateDivideInit : begin
      end
      outerFsm_enumDef_stateDivDo : begin
      end
      outerFsm_enumDef_stateCommitDivide : begin
      end
      outerFsm_enumDef_stateFinish : begin
      end
      default : begin
        outerFsm_wantStart = 1'b1;
      end
    endcase
  end

  assign outerFsm_wantKill = 1'b0;
  assign outerFsm_dividend = 8'h00;
  assign io_digit0 = digits_0;
  assign io_digit1 = digits_1;
  assign io_digit2 = digits_2;
  assign io_digit3 = digits_3;
  assign _zz_when_StateMachine_l237 = (outerFsm_stateReg == outerFsm_enumDef_stateInit);
  assign _zz_when_StateMachine_l237_1 = (outerFsm_stateReg == outerFsm_enumDef_stateMulTen);
  assign _zz_when_StateMachine_l237_2 = (outerFsm_stateNext == outerFsm_enumDef_stateInit);
  assign _zz_when_StateMachine_l237_3 = (outerFsm_stateNext == outerFsm_enumDef_stateMulTen);
  always @(*) begin
    outerFsm_stateNext = outerFsm_stateReg;
    case(outerFsm_stateReg)
      outerFsm_enumDef_stateInit : begin
        if(when_TopModule_l43) begin
          outerFsm_stateNext = outerFsm_enumDef_stateMulTen;
        end
      end
      outerFsm_enumDef_stateMulTen : begin
        if(when_TopModule_l56) begin
          outerFsm_stateNext = outerFsm_enumDef_stateDivideInit;
        end
      end
      outerFsm_enumDef_stateDivideInit : begin
        outerFsm_stateNext = outerFsm_enumDef_stateDivDo;
      end
      outerFsm_enumDef_stateDivDo : begin
        if(when_TopModule_l76) begin
          outerFsm_stateNext = outerFsm_enumDef_stateCommitDivide;
        end
      end
      outerFsm_enumDef_stateCommitDivide : begin
        if(when_TopModule_l97) begin
          if(when_TopModule_l102) begin
            outerFsm_stateNext = outerFsm_enumDef_stateFinish;
          end else begin
            outerFsm_stateNext = outerFsm_enumDef_stateMulTen;
          end
        end else begin
          outerFsm_stateNext = outerFsm_enumDef_stateDivideInit;
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

  assign when_TopModule_l43 = (outerFsm_innerCounter == 4'b0000);
  assign when_TopModule_l56 = (outerFsm_innerCounter == 4'b0000);
  assign when_TopModule_l76 = (outerFsm_divideCounter == 4'b0000);
  assign when_TopModule_l83 = (_zz_when_TopModule_l83 <= outerFsm_accumulator[15 : 7]);
  assign _zz_12 = (outerFsm_innerCounter - 4'b0001);
  assign when_TopModule_l97 = (outerFsm_innerCounter == 4'b0000);
  assign when_TopModule_l102 = (outerFsm_outerCounter == 4'b0000);
  assign when_StateMachine_l237 = (_zz_when_StateMachine_l237 && (! _zz_when_StateMachine_l237_2));
  assign when_StateMachine_l237_1 = (_zz_when_StateMachine_l237_1 && (! _zz_when_StateMachine_l237_3));
  assign when_StateMachine_l253 = ((! _zz_when_StateMachine_l237) && _zz_when_StateMachine_l237_2);
  assign when_StateMachine_l253_1 = ((! _zz_when_StateMachine_l237_1) && _zz_when_StateMachine_l237_3);
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      digits_0 <= 4'b0000;
      digits_1 <= 4'b0000;
      digits_2 <= 4'b0000;
      digits_3 <= 4'b0000;
      outerFsm_outerCounter <= 4'b0000;
      outerFsm_innerCounter <= 4'b0000;
      outerFsm_divisor <= 4'b0000;
      outerFsm_divideCounter <= 4'b0000;
      outerFsm_accumulator <= 16'h0000;
      outerFsm_quotient <= 8'h00;
      outerFsm_remainder <= 8'h00;
      outerFsm_stateReg <= outerFsm_enumDef_BOOT;
    end else begin
      outerFsm_stateReg <= outerFsm_stateNext;
      case(outerFsm_stateReg)
        outerFsm_enumDef_stateInit : begin
          if(!when_TopModule_l43) begin
            outerFsm_innerCounter <= (outerFsm_innerCounter - 4'b0001);
          end
        end
        outerFsm_enumDef_stateMulTen : begin
          if(!when_TopModule_l56) begin
            outerFsm_innerCounter <= (outerFsm_innerCounter - 4'b0001);
          end
        end
        outerFsm_enumDef_stateDivideInit : begin
          outerFsm_divideCounter <= 4'b1000;
          outerFsm_divisor <= (outerFsm_innerCounter + 4'b0010);
          outerFsm_accumulator <= {8'd0, _zz_outerFsm_accumulator};
        end
        outerFsm_enumDef_stateDivDo : begin
          if(when_TopModule_l76) begin
            outerFsm_quotient <= outerFsm_accumulator[7 : 0];
            outerFsm_remainder <= outerFsm_accumulator[15 : 8];
          end else begin
            outerFsm_divideCounter <= (outerFsm_divideCounter - 4'b0001);
          end
          if(when_TopModule_l83) begin
            outerFsm_accumulator <= {{_zz_outerFsm_accumulator_1[7 : 0],outerFsm_accumulator[6 : 0]},1'b1};
          end else begin
            outerFsm_accumulator <= (outerFsm_accumulator <<< 1);
          end
        end
        outerFsm_enumDef_stateCommitDivide : begin
          outerFsm_innerCounter <= (outerFsm_innerCounter - 4'b0001);
          if(when_TopModule_l97) begin
            digits_0 <= outerFsm_quotient[3:0];
            digits_1 <= digits_0;
            digits_2 <= digits_1;
            digits_3 <= digits_2;
            if(!when_TopModule_l102) begin
              outerFsm_outerCounter <= (outerFsm_outerCounter - 4'b0001);
            end
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
      if(when_StateMachine_l237_1) begin
        outerFsm_innerCounter <= 4'b1010;
      end
      if(when_StateMachine_l253) begin
        outerFsm_innerCounter <= 4'b1010;
        outerFsm_outerCounter <= 4'b1000;
      end
      if(when_StateMachine_l253_1) begin
        outerFsm_innerCounter <= 4'b1010;
      end
    end
  end


endmodule
