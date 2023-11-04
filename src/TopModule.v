// Generator : SpinalHDL v1.9.3    git head : 029104c77a54c53f1edda327a3bea333f7d65fd9
// Component : TopModule
// Git hash  : 7a66d5380aa1e86f041a36799f0db0a3844d6935

module TopModule (
  input               io_ena,
  output     [3:0]    io_digit0,
  output     [3:0]    io_digit1,
  output     [3:0]    io_digit2,
  output     [3:0]    io_digit3,
  input               clk,
  input               resetn
);

  wire       [19:0]   div1_io_accumulatorNext;
  wire       [5:0]    div1_io_quotient;
  wire       [5:0]    div1_io_remainder;
  wire       [19:0]   div2_io_accumulatorNext;
  wire       [5:0]    div2_io_quotient;
  wire       [5:0]    div2_io_remainder;
  wire       [4:0]    _zz_outerCounter_valueNext;
  wire       [0:0]    _zz_outerCounter_valueNext_1;
  wire       [2:0]    _zz_slideCounter_valueNext;
  wire       [0:0]    _zz_slideCounter_valueNext_1;
  wire       [9:0]    _zz_accumulator;
  wire       [10:0]   _zz_accumulator_1;
  wire       [9:0]    _zz_accumulator_2;
  wire       [10:0]   _zz_accumulator_3;
  wire       [6:0]    _zz_accumulator_4;
  reg        [3:0]    digits_0;
  reg        [3:0]    digits_1;
  reg        [3:0]    digits_2;
  reg        [3:0]    digits_3;
  reg                 outerCounter_willIncrement;
  wire                outerCounter_willClear;
  reg        [4:0]    outerCounter_valueNext;
  reg        [4:0]    outerCounter_value;
  wire                outerCounter_willOverflowIfInc;
  wire                outerCounter_willOverflow;
  reg        [5:0]    innerCounter;
  reg                 slideCounter_willIncrement;
  wire                slideCounter_willClear;
  reg        [2:0]    slideCounter_valueNext;
  reg        [2:0]    slideCounter_value;
  wire                slideCounter_willOverflowIfInc;
  wire                slideCounter_willOverflow;
  wire                dataIsValid;
  wire                startOfInnerLoop;
  wire                startOfOuterLoop;
  reg        [5:0]    mem_0;
  reg        [5:0]    mem_1;
  reg        [5:0]    mem_2;
  reg        [5:0]    mem_3;
  reg        [5:0]    mem_4;
  reg        [5:0]    mem_5;
  reg        [5:0]    mem_6;
  reg        [5:0]    mem_7;
  reg        [5:0]    mem_8;
  reg        [5:0]    mem_9;
  reg        [5:0]    mem_10;
  reg        [5:0]    mem_11;
  reg        [5:0]    mem_12;
  reg        [5:0]    mem_13;
  reg        [5:0]    mem_14;
  reg        [5:0]    mem_15;
  reg        [5:0]    mem_16;
  reg        [5:0]    mem_17;
  reg        [5:0]    mem_18;
  reg        [5:0]    mem_19;
  reg        [5:0]    mem_20;
  reg        [5:0]    mem_21;
  reg        [5:0]    mem_22;
  reg        [5:0]    mem_23;
  reg        [5:0]    mem_24;
  reg        [5:0]    mem_25;
  reg        [5:0]    mem_26;
  reg        [5:0]    mem_27;
  reg        [5:0]    mem_28;
  reg        [5:0]    mem_29;
  reg        [5:0]    mem_30;
  reg        [5:0]    mem_31;
  reg        [5:0]    mem_32;
  wire                when_TopModule_l37;
  reg        [19:0]   accumulator;
  wire       [5:0]    quotient;
  wire                when_TopModule_l101;

  assign _zz_outerCounter_valueNext_1 = outerCounter_willIncrement;
  assign _zz_outerCounter_valueNext = {4'd0, _zz_outerCounter_valueNext_1};
  assign _zz_slideCounter_valueNext_1 = slideCounter_willIncrement;
  assign _zz_slideCounter_valueNext = {2'd0, _zz_slideCounter_valueNext_1};
  assign _zz_accumulator = (mem_0 * 4'b1010);
  assign _zz_accumulator_1 = ({1'b0,_zz_accumulator_2} + _zz_accumulator_3);
  assign _zz_accumulator_2 = (mem_0 * 4'b1010);
  assign _zz_accumulator_4 = {1'b0,accumulator[5 : 0]};
  assign _zz_accumulator_3 = {4'd0, _zz_accumulator_4};
  DividerDatapath div1 (
    .io_divisor         (innerCounter[5:0]            ), //i
    .io_accumulatorCurr (accumulator[19:0]            ), //i
    .io_accumulatorNext (div1_io_accumulatorNext[19:0]), //o
    .io_quotient        (div1_io_quotient[5:0]        ), //o
    .io_remainder       (div1_io_remainder[5:0]       )  //o
  );
  DividerDatapath div2 (
    .io_divisor         (innerCounter[5:0]            ), //i
    .io_accumulatorCurr (div1_io_accumulatorNext[19:0]), //i
    .io_accumulatorNext (div2_io_accumulatorNext[19:0]), //o
    .io_quotient        (div2_io_quotient[5:0]        ), //o
    .io_remainder       (div2_io_remainder[5:0]       )  //o
  );
  always @(*) begin
    outerCounter_willIncrement = 1'b0;
    if(slideCounter_willOverflow) begin
      if(when_TopModule_l37) begin
        if(!outerCounter_willOverflowIfInc) begin
          outerCounter_willIncrement = 1'b1;
        end
      end
    end
  end

  assign outerCounter_willClear = 1'b0;
  assign outerCounter_willOverflowIfInc = (outerCounter_value == 5'h1f);
  assign outerCounter_willOverflow = (outerCounter_willOverflowIfInc && outerCounter_willIncrement);
  always @(*) begin
    outerCounter_valueNext = (outerCounter_value + _zz_outerCounter_valueNext);
    if(outerCounter_willClear) begin
      outerCounter_valueNext = 5'h00;
    end
  end

  always @(*) begin
    slideCounter_willIncrement = 1'b0;
    if(io_ena) begin
      slideCounter_willIncrement = 1'b1;
    end
  end

  assign slideCounter_willClear = 1'b0;
  assign slideCounter_willOverflowIfInc = (slideCounter_value == 3'b101);
  assign slideCounter_willOverflow = (slideCounter_willOverflowIfInc && slideCounter_willIncrement);
  always @(*) begin
    if(slideCounter_willOverflow) begin
      slideCounter_valueNext = 3'b000;
    end else begin
      slideCounter_valueNext = (slideCounter_value + _zz_slideCounter_valueNext);
    end
    if(slideCounter_willClear) begin
      slideCounter_valueNext = 3'b000;
    end
  end

  assign dataIsValid = (slideCounter_value == 3'b000);
  assign startOfInnerLoop = (innerCounter == 6'h22);
  assign startOfOuterLoop = (outerCounter_value == 5'h00);
  assign when_TopModule_l37 = (innerCounter == 6'h02);
  assign quotient = accumulator[5 : 0];
  assign when_TopModule_l101 = ((! (startOfInnerLoop && startOfOuterLoop)) && slideCounter_willOverflow);
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
      outerCounter_value <= 5'h00;
      innerCounter <= 6'h22;
      slideCounter_value <= 3'b000;
      mem_0 <= 6'h20;
      mem_1 <= 6'h20;
      mem_2 <= 6'h20;
      mem_3 <= 6'h20;
      mem_4 <= 6'h20;
      mem_5 <= 6'h20;
      mem_6 <= 6'h20;
      mem_7 <= 6'h20;
      mem_8 <= 6'h20;
      mem_9 <= 6'h20;
      mem_10 <= 6'h20;
      mem_11 <= 6'h20;
      mem_12 <= 6'h20;
      mem_13 <= 6'h20;
      mem_14 <= 6'h20;
      mem_15 <= 6'h20;
      mem_16 <= 6'h20;
      mem_17 <= 6'h20;
      mem_18 <= 6'h20;
      mem_19 <= 6'h20;
      mem_20 <= 6'h20;
      mem_21 <= 6'h20;
      mem_22 <= 6'h20;
      mem_23 <= 6'h20;
      mem_24 <= 6'h20;
      mem_25 <= 6'h20;
      mem_26 <= 6'h20;
      mem_27 <= 6'h20;
      mem_28 <= 6'h20;
      mem_29 <= 6'h20;
      mem_30 <= 6'h20;
      mem_31 <= 6'h20;
      mem_32 <= 6'h20;
      accumulator <= 20'h00000;
    end else begin
      outerCounter_value <= outerCounter_valueNext;
      slideCounter_value <= slideCounter_valueNext;
      if(slideCounter_willOverflow) begin
        if(when_TopModule_l37) begin
          if(!outerCounter_willOverflowIfInc) begin
            innerCounter <= 6'h22;
          end
        end else begin
          innerCounter <= (innerCounter - 6'h01);
        end
      end
      if(dataIsValid) begin
        if(startOfInnerLoop) begin
          accumulator <= {10'd0, _zz_accumulator};
        end else begin
          accumulator <= {9'd0, _zz_accumulator_1};
        end
      end else begin
        accumulator <= div2_io_accumulatorNext;
      end
      mem_0[0] <= mem_1[5];
      mem_1[0] <= mem_2[5];
      mem_2[0] <= mem_3[5];
      mem_3[0] <= mem_4[5];
      mem_4[0] <= mem_5[5];
      mem_5[0] <= mem_6[5];
      mem_6[0] <= mem_7[5];
      mem_7[0] <= mem_8[5];
      mem_8[0] <= mem_9[5];
      mem_9[0] <= mem_10[5];
      mem_10[0] <= mem_11[5];
      mem_11[0] <= mem_12[5];
      mem_12[0] <= mem_13[5];
      mem_13[0] <= mem_14[5];
      mem_14[0] <= mem_15[5];
      mem_15[0] <= mem_16[5];
      mem_16[0] <= mem_17[5];
      mem_17[0] <= mem_18[5];
      mem_18[0] <= mem_19[5];
      mem_19[0] <= mem_20[5];
      mem_20[0] <= mem_21[5];
      mem_21[0] <= mem_22[5];
      mem_22[0] <= mem_23[5];
      mem_23[0] <= mem_24[5];
      mem_24[0] <= mem_25[5];
      mem_25[0] <= mem_26[5];
      mem_26[0] <= mem_27[5];
      mem_27[0] <= mem_28[5];
      mem_28[0] <= mem_29[5];
      mem_29[0] <= mem_30[5];
      mem_30[0] <= mem_31[5];
      mem_31[0] <= mem_32[5];
      mem_0[1] <= mem_0[0];
      mem_0[2] <= mem_0[1];
      mem_0[3] <= mem_0[2];
      mem_0[4] <= mem_0[3];
      mem_0[5] <= mem_0[4];
      mem_1[1] <= mem_1[0];
      mem_1[2] <= mem_1[1];
      mem_1[3] <= mem_1[2];
      mem_1[4] <= mem_1[3];
      mem_1[5] <= mem_1[4];
      mem_2[1] <= mem_2[0];
      mem_2[2] <= mem_2[1];
      mem_2[3] <= mem_2[2];
      mem_2[4] <= mem_2[3];
      mem_2[5] <= mem_2[4];
      mem_3[1] <= mem_3[0];
      mem_3[2] <= mem_3[1];
      mem_3[3] <= mem_3[2];
      mem_3[4] <= mem_3[3];
      mem_3[5] <= mem_3[4];
      mem_4[1] <= mem_4[0];
      mem_4[2] <= mem_4[1];
      mem_4[3] <= mem_4[2];
      mem_4[4] <= mem_4[3];
      mem_4[5] <= mem_4[4];
      mem_5[1] <= mem_5[0];
      mem_5[2] <= mem_5[1];
      mem_5[3] <= mem_5[2];
      mem_5[4] <= mem_5[3];
      mem_5[5] <= mem_5[4];
      mem_6[1] <= mem_6[0];
      mem_6[2] <= mem_6[1];
      mem_6[3] <= mem_6[2];
      mem_6[4] <= mem_6[3];
      mem_6[5] <= mem_6[4];
      mem_7[1] <= mem_7[0];
      mem_7[2] <= mem_7[1];
      mem_7[3] <= mem_7[2];
      mem_7[4] <= mem_7[3];
      mem_7[5] <= mem_7[4];
      mem_8[1] <= mem_8[0];
      mem_8[2] <= mem_8[1];
      mem_8[3] <= mem_8[2];
      mem_8[4] <= mem_8[3];
      mem_8[5] <= mem_8[4];
      mem_9[1] <= mem_9[0];
      mem_9[2] <= mem_9[1];
      mem_9[3] <= mem_9[2];
      mem_9[4] <= mem_9[3];
      mem_9[5] <= mem_9[4];
      mem_10[1] <= mem_10[0];
      mem_10[2] <= mem_10[1];
      mem_10[3] <= mem_10[2];
      mem_10[4] <= mem_10[3];
      mem_10[5] <= mem_10[4];
      mem_11[1] <= mem_11[0];
      mem_11[2] <= mem_11[1];
      mem_11[3] <= mem_11[2];
      mem_11[4] <= mem_11[3];
      mem_11[5] <= mem_11[4];
      mem_12[1] <= mem_12[0];
      mem_12[2] <= mem_12[1];
      mem_12[3] <= mem_12[2];
      mem_12[4] <= mem_12[3];
      mem_12[5] <= mem_12[4];
      mem_13[1] <= mem_13[0];
      mem_13[2] <= mem_13[1];
      mem_13[3] <= mem_13[2];
      mem_13[4] <= mem_13[3];
      mem_13[5] <= mem_13[4];
      mem_14[1] <= mem_14[0];
      mem_14[2] <= mem_14[1];
      mem_14[3] <= mem_14[2];
      mem_14[4] <= mem_14[3];
      mem_14[5] <= mem_14[4];
      mem_15[1] <= mem_15[0];
      mem_15[2] <= mem_15[1];
      mem_15[3] <= mem_15[2];
      mem_15[4] <= mem_15[3];
      mem_15[5] <= mem_15[4];
      mem_16[1] <= mem_16[0];
      mem_16[2] <= mem_16[1];
      mem_16[3] <= mem_16[2];
      mem_16[4] <= mem_16[3];
      mem_16[5] <= mem_16[4];
      mem_17[1] <= mem_17[0];
      mem_17[2] <= mem_17[1];
      mem_17[3] <= mem_17[2];
      mem_17[4] <= mem_17[3];
      mem_17[5] <= mem_17[4];
      mem_18[1] <= mem_18[0];
      mem_18[2] <= mem_18[1];
      mem_18[3] <= mem_18[2];
      mem_18[4] <= mem_18[3];
      mem_18[5] <= mem_18[4];
      mem_19[1] <= mem_19[0];
      mem_19[2] <= mem_19[1];
      mem_19[3] <= mem_19[2];
      mem_19[4] <= mem_19[3];
      mem_19[5] <= mem_19[4];
      mem_20[1] <= mem_20[0];
      mem_20[2] <= mem_20[1];
      mem_20[3] <= mem_20[2];
      mem_20[4] <= mem_20[3];
      mem_20[5] <= mem_20[4];
      mem_21[1] <= mem_21[0];
      mem_21[2] <= mem_21[1];
      mem_21[3] <= mem_21[2];
      mem_21[4] <= mem_21[3];
      mem_21[5] <= mem_21[4];
      mem_22[1] <= mem_22[0];
      mem_22[2] <= mem_22[1];
      mem_22[3] <= mem_22[2];
      mem_22[4] <= mem_22[3];
      mem_22[5] <= mem_22[4];
      mem_23[1] <= mem_23[0];
      mem_23[2] <= mem_23[1];
      mem_23[3] <= mem_23[2];
      mem_23[4] <= mem_23[3];
      mem_23[5] <= mem_23[4];
      mem_24[1] <= mem_24[0];
      mem_24[2] <= mem_24[1];
      mem_24[3] <= mem_24[2];
      mem_24[4] <= mem_24[3];
      mem_24[5] <= mem_24[4];
      mem_25[1] <= mem_25[0];
      mem_25[2] <= mem_25[1];
      mem_25[3] <= mem_25[2];
      mem_25[4] <= mem_25[3];
      mem_25[5] <= mem_25[4];
      mem_26[1] <= mem_26[0];
      mem_26[2] <= mem_26[1];
      mem_26[3] <= mem_26[2];
      mem_26[4] <= mem_26[3];
      mem_26[5] <= mem_26[4];
      mem_27[1] <= mem_27[0];
      mem_27[2] <= mem_27[1];
      mem_27[3] <= mem_27[2];
      mem_27[4] <= mem_27[3];
      mem_27[5] <= mem_27[4];
      mem_28[1] <= mem_28[0];
      mem_28[2] <= mem_28[1];
      mem_28[3] <= mem_28[2];
      mem_28[4] <= mem_28[3];
      mem_28[5] <= mem_28[4];
      mem_29[1] <= mem_29[0];
      mem_29[2] <= mem_29[1];
      mem_29[3] <= mem_29[2];
      mem_29[4] <= mem_29[3];
      mem_29[5] <= mem_29[4];
      mem_30[1] <= mem_30[0];
      mem_30[2] <= mem_30[1];
      mem_30[3] <= mem_30[2];
      mem_30[4] <= mem_30[3];
      mem_30[5] <= mem_30[4];
      mem_31[1] <= mem_31[0];
      mem_31[2] <= mem_31[1];
      mem_31[3] <= mem_31[2];
      mem_31[4] <= mem_31[3];
      mem_31[5] <= mem_31[4];
      if(when_TopModule_l101) begin
        mem_32 <= div2_io_remainder;
      end else begin
        mem_32[0] <= mem_0[5];
        mem_32[1] <= mem_32[0];
        mem_32[2] <= mem_32[1];
        mem_32[3] <= mem_32[2];
        mem_32[4] <= mem_32[3];
        mem_32[5] <= mem_32[4];
      end
      if(dataIsValid) begin
        if(startOfInnerLoop) begin
          if(startOfOuterLoop) begin
            digits_0 <= 4'b0010;
          end else begin
            digits_0 <= quotient[3:0];
          end
          digits_1 <= digits_0;
          digits_2 <= digits_1;
          digits_3 <= digits_2;
        end
      end
    end
  end


endmodule

//DividerDatapath_1 replaced by DividerDatapath

module DividerDatapath (
  input      [5:0]    io_divisor,
  input      [19:0]   io_accumulatorCurr,
  output reg [19:0]   io_accumulatorNext,
  output     [5:0]    io_quotient,
  output     [5:0]    io_remainder
);

  wire       [9:0]    _zz_io_quotient;
  wire       [9:0]    _zz_io_remainder;
  wire       [9:0]    _zz_difference;
  wire       [9:0]    _zz_when_DividerDatapath_l23;
  wire       [19:0]   accumulator_lshift;
  wire       [9:0]    difference;
  wire                when_DividerDatapath_l23;

  assign _zz_io_quotient = io_accumulatorNext[9 : 0];
  assign _zz_io_remainder = io_accumulatorNext[19 : 10];
  assign _zz_difference = {4'd0, io_divisor};
  assign _zz_when_DividerDatapath_l23 = {4'd0, io_divisor};
  assign io_quotient = _zz_io_quotient[5:0];
  assign io_remainder = _zz_io_remainder[5:0];
  assign accumulator_lshift = (io_accumulatorCurr <<< 1);
  assign difference = (accumulator_lshift[19 : 10] - _zz_difference);
  assign when_DividerDatapath_l23 = (_zz_when_DividerDatapath_l23 <= accumulator_lshift[19 : 10]);
  always @(*) begin
    if(when_DividerDatapath_l23) begin
      io_accumulatorNext = {{difference,accumulator_lshift[9 : 1]},1'b1};
    end else begin
      io_accumulatorNext = accumulator_lshift;
    end
  end


endmodule
