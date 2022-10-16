module counter_min(
    input clk_in,
    input mode_setcurrent,
    input [3:0] set_first,
    input [3:0] set_second,
    input [3:0] set_third,
    input [3:0] set_fourth,
    output reg [3:0] first,
    output reg [3:0] second,
    output reg [3:0] third,
    output reg [3:0] fourth
    );
    initial first = 0;
    initial second = 0;
    initial third = 0;
    initial fourth = 0;
	
  
    always @(posedge clk_in or posedge mode_setcurrent)
    begin //end 38
        if(mode_setcurrent)
        begin
            first <= set_first;
            second <= set_second;
            third <= set_third;
            fourth <= set_fourth;
        end
        else
        begin    
            if(first == 9) begin  //end 32 case
               first <= 0;
               if (second == 5)begin
                  second <= 0;
                  if (fourth == 2 && third == 3)begin//25    24.00
                    first <= 0;
                    second <= 0;
                    fourth <= 0;
                    third <= 0;
                 end//20
                 else if(third == 9) begin//29
                    third <= 0;
                    fourth <= fourth + 1;
                    end//26
                  else
                    third <= third + 1;
               end//16
              else 
                second <= second + 1;
              end
            else
                first <= first + 1;
        end
	end//beggin 14
endmodule