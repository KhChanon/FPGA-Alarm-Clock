module set_currentM(
    input btn_signal,
    input mode_setcurrent,
    output reg [3:0] first,
    output reg [3:0] second
    );
    initial first = 0;
    initial second = 0;
    always @(posedge btn_signal) 
    begin //end 38
        if(mode_setcurrent)
        begin
            if(first == 9) 
            begin  //end 32 case
               first <= 0;
               if (second == 5)
                  second <= 0;
               else 
                second <= second + 1;
            end
            else
                first <= first + 1;
        end
	end//beggin 14
endmodule
