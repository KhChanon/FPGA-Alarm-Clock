module re_seg(
    input clk,
    output reg [24:0] refresh
    );
    initial refresh = 0;
  
    always @ (posedge clk) begin
    	refresh <= refresh+1;
    end
endmodule