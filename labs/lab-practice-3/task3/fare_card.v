// next_bal: works out what bal should become at the next clock edge
module next_bal (input [5:0] bal, input top, tap, clr, ok,
                 output reg [5:0] next);
  reg [5:0] sum;                          // bal plus one top-up of 20
  always @(*) begin
    sum = bal + 6'd20;
    if (clr)            next = 6'd0;                          // card cleared
    else if (top)       next = (sum > 6'd60) ? 6'd60 : sum;   // top-up, capped at 60
    else if (tap && ok) next = bal - 6'd15;                   // a ride is paid for
    else                next = bal;
  end
endmodule

// bal_reg: stores bal; rst_n clears it
module bal_reg (input clk, rst_n, input [5:0] d, output reg [5:0] q);
  always @(posedge clk or negedge rst_n)
    if (!rst_n) q <= 6'd0;
    else        q <= d;
endmodule

// ok_check: ok = 1 while bal is enough for a ride
module ok_check (input [5:0] bal, output ok);
  assign ok = (bal > 6'd15);
endmodule

// fare_card: top level
module fare_card (input clk, rst_n, top, tap, clr,
                  output [5:0] bal, output ok);
  wire [5:0] next;
  next_bal U1 (bal, top, tap, clr, ok, next);
  bal_reg  U2 (clk, rst_n, next, bal);
  ok_check U3 (bal, ok);
endmodule
