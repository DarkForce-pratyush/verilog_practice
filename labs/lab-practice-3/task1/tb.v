// tb.v -- Part A. Checks module and port names only. Do not change it.
`timescale 1ns/1ps
module tb;
  reg        clk = 0, rst = 1;
  reg  [3:0] btn = 4'b0000;
  wire [2:0] floor, floor_t;
  wire [1:0] disp,  disp_t;
  wire       door, err, door_t, u_t, d_t, e_t;

  lift_ctrl  dut (.clk(clk), .rst(rst), .btn(btn),
                  .floor(floor), .door(door), .disp(disp), .err(err));
  btn_enc    t1  (.up(1'b0), .dn(1'b0), .u(u_t), .d(d_t), .e(e_t));
  floor_ctrl t2  (.clk(clk), .rst(rst), .req_up(1'b0), .req_dn(1'b0), .err(1'b0),
                  .floor(floor_t), .door(door_t), .disp(disp_t));

  initial begin
    #1 $display("Module and port names OK");
    $finish;
  end
endmodule
