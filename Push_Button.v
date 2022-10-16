module Push_Button(
    input button,
    input clk,
    output pulse
    );
    
    wire Q1, Not_Q1, Q2, Not_Q2;
    D_FF D1(clk,button,Q1,Not_Q1);
    D_FF D2(clk,Q1,Q2,Not_Q2);
    
    assign pulse = Q1 & Not_Q2;
endmodule
