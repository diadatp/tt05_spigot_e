`default_nettype none
`timescale 1ns / 1ps

module tt_um_diadatp_spigot_e (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire [3:0] digit0;
  wire [3:0] digit1;
  wire [3:0] digit2;
  wire [3:0] digit3;

  TopModule i_TopModule (
      .clk(clk),
      .resetn(rst_n),
      .io_ena(ena),
      .io_digit0(digit0),
      .io_digit1(digit1),
      .io_digit2(digit2),
      .io_digit3(digit3)
  );

  // set all bidir pins to output
  assign uio_oe  = 8'b1111_1111;

  assign uio_out = (1 == ena) ? {digit0, digit1} : 0;
  assign uo_out  = (1 == ena) ? {digit2, digit3} : 0;

endmodule
