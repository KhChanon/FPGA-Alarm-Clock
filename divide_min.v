module divide_min(
    input clock,
    output clk_min
    );
    reg elapsed;//elapsed time 1 minute
    reg [27:0] state;
  
    always @ (posedge clock)
      if (state == 60) state <= 0;
      else state <= state + 1;
    always @(state)
      if (state == 60) elapsed <= 1;
      else elapsed <= 0;
    assign clk_min = elapsed;
endmodule