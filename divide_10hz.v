module divide_10hz(
    input clock,
    output clk_out
    );
    reg elapsed;//elapsed time 1 second
    reg [27:0] state;
    always @ (posedge clock)
    if (state == 10000000) state <= 0;
      else state <= state + 1;
    always @(state)
      if (state == 10000000) elapsed <= 1;
      else elapsed <= 0;
    assign clk_out = elapsed;
endmodule