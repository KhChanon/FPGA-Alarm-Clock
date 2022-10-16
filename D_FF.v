module D_FF(
    input clk,
    input D,
    output reg Q,
    output reg NotQ
    );
    always @(posedge clk)
    begin
        Q <= D;
        NotQ <= ~Q;
    end
endmodule
