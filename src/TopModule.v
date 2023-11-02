// Generator : SpinalHDL v1.9.3    git head : 029104c77a54c53f1edda327a3bea333f7d65fd9
// Component : TopModule
// Git hash  : fe1eadfb894ff8617855c6f107fc6863b9e73f42

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
  wire       [8:0]    _zz_diff;
  wire       [7:0]    _zz_accumulator;
  wire       [8:0]    _zz_accumulator_1;
  wire       [7:0]    _zz_accumulator_2;
  wire       [8:0]    _zz_accumulator_3;
  wire       [4:0]    _zz_accumulator_4;
  wire       [8:0]    _zz_when_TopModule_l81;
  reg        [3:0]    digits_0;
  reg        [3:0]    digits_1;
  reg        [3:0]    digits_2;
  reg        [3:0]    digits_3;
  reg        [3:0]    outerCounter;
  reg        [4:0]    innerCounter;
  wire                slideCounter_willIncrement;
  wire                slideCounter_willClear;
  reg        [3:0]    slideCounter_valueNext;
  reg        [3:0]    slideCounter_value;
  wire                slideCounter_willOverflowIfInc;
  wire                slideCounter_willOverflow;
  wire                dataIsValid;
  wire                startOfInnerLoop;
  wire                startOfOuterLoop;
  reg        [3:0]    mem_0;
  reg        [3:0]    mem_1;
  reg        [3:0]    mem_2;
  reg        [3:0]    mem_3;
  reg        [3:0]    mem_4;
  reg        [3:0]    mem_5;
  reg        [3:0]    mem_6;
  reg        [3:0]    mem_7;
  reg        [3:0]    mem_8;
  reg        [3:0]    mem_9;
  reg        [3:0]    mem_10;
  reg        [3:0]    mem_11;
  reg        [3:0]    mem_12;
  reg        [3:0]    mem_13;
  reg        [3:0]    mem_14;
  wire                when_TopModule_l36;
  wire                when_TopModule_l37;
  reg        [17:0]   accumulator;
  wire       [3:0]    quotient;
  wire       [3:0]    remainder;
  wire       [17:0]   accumulator_lshift;
  wire       [8:0]    diff;
  wire                when_TopModule_l76;
  wire                when_TopModule_l81;

  assign _zz_slideCounter_valueNext_1 = slideCounter_willIncrement;
  assign _zz_slideCounter_valueNext = {3'd0, _zz_slideCounter_valueNext_1};
  assign _zz_diff = {4'd0, innerCounter};
  assign _zz_accumulator = (mem_0 * 4'b1010);
  assign _zz_accumulator_1 = ({1'b0,_zz_accumulator_2} + _zz_accumulator_3);
  assign _zz_accumulator_2 = (mem_0 * 4'b1010);
  assign _zz_accumulator_4 = {1'b0,quotient};
  assign _zz_accumulator_3 = {4'd0, _zz_accumulator_4};
  assign _zz_when_TopModule_l81 = {4'd0, innerCounter};
  assign slideCounter_willClear = 1'b0;
  assign slideCounter_willOverflowIfInc = (slideCounter_value == 4'b1001);
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
  assign dataIsValid = (slideCounter_value == 4'b0000);
  assign startOfInnerLoop = (innerCounter == 5'h10);
  assign startOfOuterLoop = (outerCounter == 4'b0000);
  assign when_TopModule_l36 = (innerCounter == 5'h02);
  assign when_TopModule_l37 = (outerCounter == 4'b1100);
  assign quotient = accumulator[3 : 0];
  assign remainder = accumulator[12 : 9];
  assign accumulator_lshift = (accumulator <<< 1);
  assign diff = (accumulator_lshift[17 : 9] - _zz_diff);
  assign when_TopModule_l76 = (! (startOfInnerLoop && startOfOuterLoop));
  assign when_TopModule_l81 = (_zz_when_TopModule_l81 <= accumulator_lshift[17 : 9]);
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
      outerCounter <= 4'b0000;
      innerCounter <= 5'h10;
      slideCounter_value <= 4'b0000;
      mem_0 <= 4'b0001;
      mem_1 <= 4'b0001;
      mem_2 <= 4'b0001;
      mem_3 <= 4'b0001;
      mem_4 <= 4'b0001;
      mem_5 <= 4'b0001;
      mem_6 <= 4'b0001;
      mem_7 <= 4'b0001;
      mem_8 <= 4'b0001;
      mem_9 <= 4'b0001;
      mem_10 <= 4'b0001;
      mem_11 <= 4'b0001;
      mem_12 <= 4'b0001;
      mem_13 <= 4'b0001;
      mem_14 <= 4'b0001;
      accumulator <= 18'h00000;
    end else begin
      slideCounter_value <= slideCounter_valueNext;
      if(slideCounter_willOverflow) begin
        if(when_TopModule_l36) begin
          if(!when_TopModule_l37) begin
            innerCounter <= 5'h10;
            outerCounter <= (outerCounter + 4'b0001);
          end
        end else begin
          innerCounter <= (innerCounter - 5'h01);
        end
      end
      if(slideCounter_willOverflow) begin
        mem_14 <= mem_0;
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
      end
      if(dataIsValid) begin
        if(startOfInnerLoop) begin
          accumulator <= {10'd0, _zz_accumulator};
        end else begin
          accumulator <= {9'd0, _zz_accumulator_1};
        end
        if(when_TopModule_l76) begin
          mem_14 <= remainder;
        end
      end else begin
        if(when_TopModule_l81) begin
          accumulator <= {{diff[8 : 0],accumulator_lshift[8 : 1]},1'b1};
        end else begin
          accumulator <= accumulator_lshift;
        end
      end
      if(dataIsValid) begin
        if(startOfInnerLoop) begin
          if(startOfOuterLoop) begin
            digits_0 <= 4'b0010;
          end else begin
            digits_0 <= quotient;
          end
          digits_1 <= digits_0;
          digits_2 <= digits_1;
          digits_3 <= digits_2;
        end
      end
    end
  end


endmodule
