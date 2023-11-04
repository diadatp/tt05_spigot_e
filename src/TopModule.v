// Generator : SpinalHDL v1.9.3    git head : 029104c77a54c53f1edda327a3bea333f7d65fd9
// Component : TopModule
// Git hash  : 70d2698c0d7dfd9b4c3393184912459ef46d1292

module TopModule (
  input               io_ena,
  output     [3:0]    io_digit0,
  output     [3:0]    io_digit1,
  output     [3:0]    io_digit2,
  output     [3:0]    io_digit3,
  input               clk,
  input               resetn
);

  wire       [4:0]    _zz_outerCounter_valueNext;
  wire       [0:0]    _zz_outerCounter_valueNext_1;
  wire       [3:0]    _zz_slideCounter_valueNext;
  wire       [0:0]    _zz_slideCounter_valueNext_1;
  wire       [9:0]    _zz_diff;
  wire       [8:0]    _zz_accumulator;
  wire       [9:0]    _zz_accumulator_1;
  wire       [8:0]    _zz_accumulator_2;
  wire       [9:0]    _zz_accumulator_3;
  wire       [5:0]    _zz_accumulator_4;
  wire       [9:0]    _zz_when_TopModule_l82;
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
  reg        [3:0]    slideCounter_valueNext;
  reg        [3:0]    slideCounter_value;
  wire                slideCounter_willOverflowIfInc;
  wire                slideCounter_willOverflow;
  wire                dataIsValid;
  wire                startOfInnerLoop;
  wire                startOfOuterLoop;
  reg        [4:0]    mem_0;
  reg        [4:0]    mem_1;
  reg        [4:0]    mem_2;
  reg        [4:0]    mem_3;
  reg        [4:0]    mem_4;
  reg        [4:0]    mem_5;
  reg        [4:0]    mem_6;
  reg        [4:0]    mem_7;
  reg        [4:0]    mem_8;
  reg        [4:0]    mem_9;
  reg        [4:0]    mem_10;
  reg        [4:0]    mem_11;
  reg        [4:0]    mem_12;
  reg        [4:0]    mem_13;
  reg        [4:0]    mem_14;
  reg        [4:0]    mem_15;
  reg        [4:0]    mem_16;
  reg        [4:0]    mem_17;
  reg        [4:0]    mem_18;
  reg        [4:0]    mem_19;
  reg        [4:0]    mem_20;
  reg        [4:0]    mem_21;
  reg        [4:0]    mem_22;
  reg        [4:0]    mem_23;
  reg        [4:0]    mem_24;
  reg        [4:0]    mem_25;
  reg        [4:0]    mem_26;
  reg        [4:0]    mem_27;
  reg        [4:0]    mem_28;
  reg        [4:0]    mem_29;
  reg        [4:0]    mem_30;
  reg        [4:0]    mem_31;
  wire                when_TopModule_l37;
  reg        [19:0]   accumulator;
  wire       [4:0]    quotient;
  wire       [4:0]    remainder;
  wire       [19:0]   accumulator_lshift;
  wire       [9:0]    diff;
  wire                when_TopModule_l77;
  wire                when_TopModule_l82;

  assign _zz_outerCounter_valueNext_1 = outerCounter_willIncrement;
  assign _zz_outerCounter_valueNext = {4'd0, _zz_outerCounter_valueNext_1};
  assign _zz_slideCounter_valueNext_1 = slideCounter_willIncrement;
  assign _zz_slideCounter_valueNext = {3'd0, _zz_slideCounter_valueNext_1};
  assign _zz_diff = {4'd0, innerCounter};
  assign _zz_accumulator = (mem_0 * 4'b1010);
  assign _zz_accumulator_1 = ({1'b0,_zz_accumulator_2} + _zz_accumulator_3);
  assign _zz_accumulator_2 = (mem_0 * 4'b1010);
  assign _zz_accumulator_4 = {1'b0,quotient};
  assign _zz_accumulator_3 = {4'd0, _zz_accumulator_4};
  assign _zz_when_TopModule_l82 = {4'd0, innerCounter};
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
  assign outerCounter_willOverflowIfInc = (outerCounter_value == 5'h1e);
  assign outerCounter_willOverflow = (outerCounter_willOverflowIfInc && outerCounter_willIncrement);
  always @(*) begin
    if(outerCounter_willOverflow) begin
      outerCounter_valueNext = 5'h00;
    end else begin
      outerCounter_valueNext = (outerCounter_value + _zz_outerCounter_valueNext);
    end
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
  assign slideCounter_willOverflowIfInc = (slideCounter_value == 4'b1010);
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

  assign dataIsValid = (slideCounter_value == 4'b0000);
  assign startOfInnerLoop = (innerCounter == 6'h21);
  assign startOfOuterLoop = (outerCounter_value == 5'h00);
  assign when_TopModule_l37 = (innerCounter == 6'h02);
  assign quotient = accumulator[4 : 0];
  assign remainder = accumulator[14 : 10];
  assign accumulator_lshift = (accumulator <<< 1);
  assign diff = (accumulator_lshift[19 : 10] - _zz_diff);
  assign when_TopModule_l77 = (! (startOfInnerLoop && startOfOuterLoop));
  assign when_TopModule_l82 = (_zz_when_TopModule_l82 <= accumulator_lshift[19 : 10]);
  assign io_digit0 = digits_0;
  assign io_digit1 = digits_1;
  assign io_digit2 = digits_2;
  assign io_digit3 = digits_3;
  always @(posedge clk) begin
    if(!resetn) begin
      digits_0 <= 4'b1111;
      digits_1 <= 4'b1111;
      digits_2 <= 4'b1111;
      digits_3 <= 4'b1111;
      outerCounter_value <= 5'h00;
      innerCounter <= 6'h21;
      slideCounter_value <= 4'b0000;
      mem_0 <= 5'h01;
      mem_1 <= 5'h01;
      mem_2 <= 5'h01;
      mem_3 <= 5'h01;
      mem_4 <= 5'h01;
      mem_5 <= 5'h01;
      mem_6 <= 5'h01;
      mem_7 <= 5'h01;
      mem_8 <= 5'h01;
      mem_9 <= 5'h01;
      mem_10 <= 5'h01;
      mem_11 <= 5'h01;
      mem_12 <= 5'h01;
      mem_13 <= 5'h01;
      mem_14 <= 5'h01;
      mem_15 <= 5'h01;
      mem_16 <= 5'h01;
      mem_17 <= 5'h01;
      mem_18 <= 5'h01;
      mem_19 <= 5'h01;
      mem_20 <= 5'h01;
      mem_21 <= 5'h01;
      mem_22 <= 5'h01;
      mem_23 <= 5'h01;
      mem_24 <= 5'h01;
      mem_25 <= 5'h01;
      mem_26 <= 5'h01;
      mem_27 <= 5'h01;
      mem_28 <= 5'h01;
      mem_29 <= 5'h01;
      mem_30 <= 5'h01;
      mem_31 <= 5'h01;
      accumulator <= 20'h00000;
    end else begin
      outerCounter_value <= outerCounter_valueNext;
      slideCounter_value <= slideCounter_valueNext;
      if(slideCounter_willOverflow) begin
        if(when_TopModule_l37) begin
          if(!outerCounter_willOverflowIfInc) begin
            innerCounter <= 6'h21;
          end
        end else begin
          innerCounter <= (innerCounter - 6'h01);
        end
      end
      if(slideCounter_willOverflow) begin
        mem_31 <= mem_0;
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
        mem_10 <= mem_11;
        mem_11 <= mem_12;
        mem_12 <= mem_13;
        mem_13 <= mem_14;
        mem_14 <= mem_15;
        mem_15 <= mem_16;
        mem_16 <= mem_17;
        mem_17 <= mem_18;
        mem_18 <= mem_19;
        mem_19 <= mem_20;
        mem_20 <= mem_21;
        mem_21 <= mem_22;
        mem_22 <= mem_23;
        mem_23 <= mem_24;
        mem_24 <= mem_25;
        mem_25 <= mem_26;
        mem_26 <= mem_27;
        mem_27 <= mem_28;
        mem_28 <= mem_29;
        mem_29 <= mem_30;
        mem_30 <= mem_31;
      end
      if(dataIsValid) begin
        if(startOfInnerLoop) begin
          accumulator <= {11'd0, _zz_accumulator};
        end else begin
          accumulator <= {10'd0, _zz_accumulator_1};
        end
        if(when_TopModule_l77) begin
          mem_31 <= remainder;
        end
      end else begin
        if(when_TopModule_l82) begin
          accumulator <= {{diff[9 : 0],accumulator_lshift[9 : 1]},1'b1};
        end else begin
          accumulator <= accumulator_lshift;
        end
      end
      if(dataIsValid) begin
        if(startOfInnerLoop) begin
          if(startOfOuterLoop) begin
            digits_0 <= 4'b0010;
          end else begin
            digits_0 <= quotient[3:0];
            digits_1 <= digits_0;
            digits_2 <= digits_1;
            digits_3 <= digits_2;
          end
        end
      end
    end
  end


endmodule
