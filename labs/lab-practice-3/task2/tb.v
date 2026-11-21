// tb.v -- Part B1: complete this self-checking testbench for fare_card.
// Keep the instance name dut. Do not change model.v.
// It must end by printing one line: RESULT: PASS or RESULT: FAIL
`timescale 1ns/1ps
module tb;
  reg        clk = 0, rst_n = 0, top = 0, tap = 0, clr = 0;
  wire [5:0] bal;
  wire       ok;
  fare_card dut (.clk(clk), .rst_n(rst_n), .top(top), .tap(tap), .clr(clr),
                 .bal(bal), .ok(ok));

  always #5 clk = ~clk;

  // (a) TODO: instantiate fare_model (in model.v) as the reference model,
  //     driven by the same inputs as dut.

  // (a) TODO: after every clock edge, compare bal and ok of dut with the
  //     model's outputs; on a mismatch add 1 to errors ($display helps debug).
  integer errors = 0;

  // (b) TODO: test cases. Change inputs only at falling clock edges.
  //     Cases worth trying: a top-up that goes past the cap of 60, a tap when
  //     bal is exactly 15, a tap when bal is too low, clr, and a reset pulse
  //     between two clock edges.
  initial begin
    #12 rst_n = 1;
    // ... your test cases here ...
    @(negedge clk); #1;                       // let the last check finish
    if (errors == 0) $display("RESULT: PASS");
    else             $display("RESULT: FAIL");
    $finish;
  end

  // waveform dump for the Run button: keep this block
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, tb);
    end
  end
endmodule
