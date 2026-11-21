// tb.v -- Part B2. Do NOT change the input sequence.
// You may add $display / $monitor statements here and inside fare_card.v.
`timescale 1ns/1ps
module tb;
  reg clk = 0, rst_n = 0, top = 0, tap = 0, clr = 0;
  wire [5:0] bal;
  wire ok;
  fare_card dut (.clk(clk), .rst_n(rst_n), .top(top), .tap(tap), .clr(clr),
                 .bal(bal), .ok(ok));
  string vcd_file;
  initial begin
    if ($value$plusargs("vcd=%s", vcd_file)) begin
      $dumpfile(vcd_file);
      $dumpvars(0, tb);
    end
  end

  always #5 clk = ~clk;
  initial begin
    #12 rst_n = 1;
    @(negedge clk) top = 1;
    @(negedge clk) top = 0; tap = 1;
    @(negedge clk);
    @(negedge clk) tap = 0; top = 1;
    @(negedge clk);
    @(negedge clk) top = 0; tap = 1;
    @(negedge clk);
    @(negedge clk);
    @(negedge clk) tap = 0; clr = 1;
    @(negedge clk) clr = 0; top = 1;
    @(negedge clk);
    @(negedge clk) top = 0; tap = 1;
    @(negedge clk) tap = 0; top = 1;
    @(negedge clk);
    @(negedge clk) top = 0;
    #1 rst_n = 0; #2 rst_n = 1;
    @(negedge clk) top = 1;
    @(negedge clk) top = 0;
    @(negedge clk) $finish;
  end
endmodule
