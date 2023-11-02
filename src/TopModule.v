// Generator : SpinalHDL v1.9.3    git head : 029104c77a54c53f1edda327a3bea333f7d65fd9
// Component : TopModule
// Git hash  : a9dc64edfffc35d69187172cb84fdd999a124fb4

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

  wire       [3:0]    _zz_slideCounter_valueNext;
  wire       [0:0]    _zz_slideCounter_valueNext_1;
  wire       [8:0]    _zz_dividend;
  wire       [12:0]   _zz_diff;
  wire       [12:0]   _zz_test;
  wire       [12:0]   _zz_accumulator;
  wire       [11:0]   _zz_accumulator_1;
  wire       [12:0]   _zz_accumulator_2;
  wire       [8:0]    _zz_accumulator_3;
  wire       [12:0]   _zz_when_TopModule_l73;
  reg        [3:0]    digits_0;
  reg        [3:0]    digits_1;
  reg        [3:0]    digits_2;
  reg        [3:0]    digits_3;
  reg        [7:0]    mem_0;
  reg        [7:0]    mem_1;
  reg        [7:0]    mem_2;
  reg        [7:0]    mem_3;
  reg        [7:0]    mem_4;
  reg        [7:0]    mem_5;
  reg        [7:0]    mem_6;
  reg        [7:0]    mem_7;
  reg        [7:0]    mem_8;
  reg        [7:0]    mem_9;
  reg        [7:0]    mem_10;
  reg        [3:0]    outerCounter;
  reg        [3:0]    innerCounter;
  wire                slideCounter_willIncrement;
  wire                slideCounter_willClear;
  reg        [3:0]    slideCounter_valueNext;
  reg        [3:0]    slideCounter_value;
  wire                slideCounter_willOverflowIfInc;
  wire                slideCounter_willOverflow;
  wire                when_TopModule_l31;
  wire                when_TopModule_l32;
  wire                when_TopModule_l33;
  wire                when_TopModule_l44;
  reg        [7:0]    qin;
  wire       [12:0]   dividend;
  reg        [25:0]   accumulator;
  wire       [25:0]   accumulator_lshift;
  wire       [12:0]   diff_l;
  wire       [3:0]    diff_r;
  wire       [12:0]   diff;
  wire                test;
  wire       [7:0]    quotient;
  wire       [7:0]    remainder;
  wire                when_TopModule_l67;
  reg        [25:0]   _zz_qin;
  wire                when_TopModule_l73;

  assign _zz_slideCounter_valueNext_1 = slideCounter_willIncrement;
  assign _zz_slideCounter_valueNext = {3'd0, _zz_slideCounter_valueNext_1};
  assign _zz_dividend = ({1'b0,mem_0} + {1'b0,qin});
  assign _zz_diff = {9'd0, innerCounter};
  assign _zz_test = {9'd0, innerCounter};
  assign _zz_accumulator = ({1'b0,_zz_accumulator_1} + _zz_accumulator_2);
  assign _zz_accumulator_1 = (mem_0 * 4'b1010);
  assign _zz_accumulator_3 = {1'b0,qin};
  assign _zz_accumulator_2 = {4'd0, _zz_accumulator_3};
  assign _zz_when_TopModule_l73 = {9'd0, innerCounter};
  assign slideCounter_willClear = 1'b0;
  assign slideCounter_willOverflowIfInc = (slideCounter_value == 4'b1101);
  assign slideCounter_willOverflow = (slideCounter_willOverflowIfInc && slideCounter_willIncrement);
  always @(*) begin
    if(slideCounter_willOverflow) begin
      slideCounter_valueNext = 4'b0000;
    end else begin
      slideCounter_valueNext = (slideCounter_value + _zz_slideCounter_valueNext);
    end
    if(slideCounter_willClear) begin
      slideCounter_valueNext = 4'b0000;
    end
  end

  assign slideCounter_willIncrement = 1'b1;
  assign when_TopModule_l31 = (slideCounter_value == 4'b1101);
  assign when_TopModule_l32 = (innerCounter == 4'b0010);
  assign when_TopModule_l33 = (outerCounter == 4'b0000);
  assign when_TopModule_l44 = (slideCounter_value == 4'b1101);
  assign dividend = (_zz_dividend * 4'b1010);
  assign accumulator_lshift = (accumulator <<< 1);
  assign diff_l = accumulator_lshift[25 : 13];
  assign diff_r = innerCounter;
  assign diff = (accumulator_lshift[25 : 13] - _zz_diff);
  assign test = (_zz_test <= accumulator_lshift[25 : 13]);
  assign quotient = accumulator[7:0];
  assign remainder = accumulator[20 : 13];
  assign when_TopModule_l67 = (slideCounter_value == 4'b0000);
  assign when_TopModule_l73 = (_zz_when_TopModule_l73 <= accumulator_lshift[25 : 13]);
  always @(*) begin
    if(when_TopModule_l73) begin
      _zz_qin = {{diff[12 : 0],accumulator_lshift[12 : 1]},1'b1};
    end else begin
      _zz_qin = accumulator_lshift;
    end
  end

  assign io_digit0 = digits_0;
  assign io_digit1 = digits_1;
  assign io_digit2 = digits_2;
  assign io_digit3 = digits_3;
  always @(posedge clk) begin
    if(!resetn) begin
      digits_0 <= 4'b0000;
      digits_1 <= 4'b0000;
      digits_2 <= 4'b0000;
      digits_3 <= 4'b0000;
      mem_0 <= 8'h01;
      mem_1 <= 8'h01;
      mem_2 <= 8'h01;
      mem_3 <= 8'h01;
      mem_4 <= 8'h01;
      mem_5 <= 8'h01;
      mem_6 <= 8'h01;
      mem_7 <= 8'h01;
      mem_8 <= 8'h01;
      mem_9 <= 8'h01;
      mem_10 <= 8'h01;
      outerCounter <= 4'b1000;
      innerCounter <= 4'b1100;
      slideCounter_value <= 4'b0000;
      qin <= 8'h00;
      accumulator <= 26'h0000000;
    end else begin
      slideCounter_value <= slideCounter_valueNext;
      if(when_TopModule_l31) begin
        if(when_TopModule_l32) begin
          if(!when_TopModule_l33) begin
            innerCounter <= 4'b1100;
            outerCounter <= (outerCounter - 4'b0001);
          end
        end else begin
          innerCounter <= (innerCounter - 4'b0001);
        end
      end
      if(when_TopModule_l44) begin
        mem_10 <= mem_0;
        mem_0 <= mem_1;
        mem_1 <= mem_2;
        mem_2 <= mem_3;
        mem_3 <= mem_4;
        mem_4 <= mem_5;
        mem_5 <= mem_6;
        mem_6 <= mem_7;
        mem_7 <= mem_8;
        mem_8 <= mem_9;
        mem_9 <= mem_10;
      end
      if(when_TopModule_l67) begin
        accumulator <= {13'd0, _zz_accumulator};
      end else begin
        accumulator <= _zz_qin;
        qin <= _zz_qin[7:0];
      end
      digits_0 <= quotient[3:0];
      digits_1 <= digits_0;
      digits_2 <= digits_1;
      digits_3 <= digits_2;
    end
  end


endmodule
