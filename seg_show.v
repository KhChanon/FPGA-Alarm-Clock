module seg_show(
    input [3:0] first,
    input [3:0] second,
    input [3:0] third,
    input [3:0] fourth,

    input [3:0] a_first,
    input [3:0] a_second,
    input [3:0] a_third,
    input [3:0] a_fourth,
    
    input [3:0] set_first,
    input [3:0] set_second,
    input [3:0] set_third,
    input [3:0] set_fourth,

    input [1:0] refresh,
    input mode_alarm,     //switch
    input mode_setcurrent,
    
    output reg [6:0] seg,
    output reg [3:0] an_temp
    );
    always @(*) 
      begin
		if(mode_alarm == 1)
		begin
			case (refresh)      
				2'b11: begin
					an_temp = 4'b0111;
					seg = a_fourth;
				end
				2'b10: begin
					an_temp = 4'b1011;
					seg = a_third;
				end
				2'b01: begin
					an_temp = 4'b1101;
					seg = a_second;
				end
				2'b00: begin
					an_temp = 4'b1110;
					seg = a_first;
				end
			endcase
		end
		else if(mode_setcurrent == 1)
            begin
                case (refresh)      
                    2'b11: begin
                        an_temp = 4'b0111;
                        seg = set_fourth;
                    end
                    2'b10: begin
                        an_temp = 4'b1011;
                        seg = set_third;
                    end
                    2'b01: begin
                        an_temp = 4'b1101;
                        seg = set_second;
                    end
                    2'b00: begin
                        an_temp = 4'b1110;
                        seg = set_first;
                    end
                endcase
            end
        else
		begin
			case (refresh)      
				2'b11: begin
					an_temp = 4'b0111;
					seg = fourth;
				end
				2'b10: begin
					an_temp = 4'b1011;
					seg = third;
				end
				2'b01: begin
					an_temp = 4'b1101;
					seg = second;
				end
				2'b00: begin
					an_temp = 4'b1110;
					seg = first;
				end
			endcase
		end
    end
endmodule