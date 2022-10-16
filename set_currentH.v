module set_currentH(
    input btn_signal,
    input mode_setcurrent,
    output reg [3:0] third,
    output reg [3:0] fourth
    );
    initial third = 2;
    initial fourth = 1;
    always @(posedge btn_signal) 
    begin //end 38
        if(mode_setcurrent)
        begin
            if (fourth == 2 && third == 3)
            begin 
              fourth <= 0;
              third <= 0;
            end
            else if(third == 9) 
            begin  //end 32 case
               third <= 0;
               fourth <= fourth + 1;
            end
            else
                third <= third + 1;
        end
	end//beggin 14
endmodule
