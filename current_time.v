module current_time(
    input clk,
    input alarm_enable, // alarm mode is on
    input stop_alarm,
    input mode_alarm,//switch
    input mode_setcurrent,
	input increase_hour,  // button left
 	input increase_min,   // button right
    output [6:0] seg,
    output [3:0] an,
    output [15:0] led
    );
    wire clk_sec;
    wire clk_min;
    wire clk_10hz;

    wire [3:0] first;
    wire [3:0] second;
	wire [3:0] third;
    wire [3:0] fourth;

    wire [3:0] a_first;
    wire [3:0] a_second;
	wire [3:0] a_third;
    wire [3:0] a_fourth;
    
    wire [3:0] set_first;
    wire [3:0] set_second;
    wire [3:0] set_third;
    wire [3:0] set_fourth;

    wire [24:0] refresh;
    wire [6:0] segUse;
    wire btnH_signal;
    wire btnM_signal;
	
    divide_sec sec(clk,clk_sec);
	divide_min min(clk_sec,clk_min);
    divide_10hz hz_10(clk,clk_10hz);
    
    Push_Button btnH(increase_hour,clk_10hz,btnH_signal);
    Push_Button btnM(increase_min,clk_10hz,btnM_signal);
    
    set_currentH setH(btnH_signal,mode_setcurrent,set_third,set_fourth);
    set_currentM setM(btnM_signal,mode_setcurrent,set_first,set_second);
    
    counter_min cmin(clk_min,mode_setcurrent,set_first,set_second,set_third,set_fourth,first,second,third,fourth);

    re_seg re1(clk,refresh); //quick clk

    seg_show show(first,second,third,fourth,a_first,a_second,a_third,a_fourth,set_first,set_second,set_third,set_fourth,refresh[18:17],mode_alarm,mode_setcurrent,segUse,an);
    bcdto7seg bcd(segUse,seg);
    
    set_alarmM alarmM_count(btnM_signal,mode_alarm,a_first,a_second);
    set_alarmH alarmH_count(btnH_signal,mode_alarm,a_third,a_fourth);
    alarm aclk(stop_alarm,alarm_enable,first,second,third,fourth,a_first,a_second,a_third,a_fourth,led);
endmodule