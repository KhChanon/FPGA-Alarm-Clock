module set_alarmM(
    input btn_signal,
    input mode_alarm,
    output reg [3:0] a_first,
    output reg [3:0] a_second
    );
    initial a_first = 0;
    initial a_second = 0;
    always @(posedge btn_signal) 
    begin //end 38
        if(mode_alarm)
        begin
            if(a_first == 9) 
            begin  //end 32 case
               a_first <= 0;
               if (a_second == 5)
                  a_second <= 0;
               else 
                a_second <= a_second + 1;
            end
            else
                a_first <= a_first + 1;
        end
	end//beggin 14
endmodule
