module alarm(
    input stop_alarm,   //center button
	input alarm_enable, //sw
    //////////////////////////
  	input [3:0] first,
    input [3:0] second,
    input [3:0] third,
    input [3:0] fourth,
    /////////////////////////
	input [3:0] a_first,
    input [3:0] a_second,
    input [3:0] a_third,
    input [3:0] a_fourth,
    /////////////////////////
    output reg [15:0] led
    );
    initial led = 16'b0;
    always @(first or stop_alarm or alarm_enable) 
	begin
		if(alarm_enable == 1)
		begin
			if(stop_alarm == 1)
			   led <= 16'b0;
			else
				if(fourth == a_fourth && third == a_third && second == a_second && first == a_first)
                    led <= 16'b1010101010101010;
		end
		else
		led <= 16'b0;
    end
endmodule
