module set_alarmH(
    input btn_signal,
    input mode_alarm,
    output reg [3:0] a_third,
    output reg [3:0] a_fourth
    );
    initial a_third = 2;
    initial a_fourth = 1;
    always @(posedge btn_signal) 
    begin //end 38
        if(mode_alarm)
        begin
            if (a_fourth == 2 && a_third == 3)
            begin 
              a_fourth <= 0;
              a_third <= 0;
            end
            else if(a_third == 9) 
            begin  //end 32 case
               a_third <= 0;
               a_fourth <= a_fourth + 1;
            end
            else
                a_third <= a_third + 1;
        end
	end//beggin 14
endmodule
