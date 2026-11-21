// model.v -- reference model of fare_card, written from the specification.
// Do not change this file.
module fare_model (input clk, rst_n, top, tap, clr,
                   output reg [5:0] bal, output ok);
  assign ok = (bal >= 6'd15);
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n)          bal <= 6'd0;
    else if (clr)        bal <= 6'd0;
    else if (top)        bal <= (bal + 7'd20 > 7'd60) ? 6'd60 : bal + 6'd20;
    else if (tap && ok)  bal <= bal - 6'd15;
  end
endmodule
