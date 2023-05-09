module user_logic_traffic_lite(pixelclk, clk_5Hz, color, squares);
	input pixelclk;
	input clk_5Hz;

	output [2:0] color; // 001 ; r-0 g-0 b-1  (BLUE)
	output [2:0] squares;
	
	reg [3:0] squares = 1;
	reg [2:0] color = 1;
	
	reg [1:0] state = 0;
	integer cnt = 0;
	
	parameter 	S0=2'b00, S1=2'b01, S2=2'b10;

	always@ (posedge clk_5Hz)
		begin
			if (cnt < 90)
			cnt <= cnt + 1;
				else 
				cnt <= 0;
		end
		 
always @ (posedge clk_5Hz)
	begin//state transistion
			case (state)
			
			 S0:	if (cnt <38) //red
							begin
								state <=S0;
								
						
							end
						else
							begin
								
								state <= S1; //next state
								
							end
				S1:	if (38 <cnt && cnt <51) //yellow
							begin
								state <= S1;
								
								
							end
						else
							begin
								
								state <= S2;
								
							end
				S2:	if (cnt > 51) //green
							begin
								state <= S2;
								
							end
						else
							begin
								
								state <= S0;

							end
				default: state <=S0;
				
			endcase
end

always @ (posedge pixelclk)
begin //output at each state
	case (state)
	
		S0:	begin //red
		
					color = 4; //red
					squares = 1;
				
				end
		S1:	begin //yellow
				
					color =6; //red & green (yellow)
					squares = 2;
					
				end
		S2:	begin //green
				
					color = 2;
					squares = 4;
					
				end
		endcase
end
endmodule 

