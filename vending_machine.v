module vending_machine(nickle, dime, quarter, clk, reset, item, change);
input nickle, dime, quarter, clk, reset;
output item, change;
reg item, change;
reg [3:0]state = 0;
reg [2:0]cnt = 0;

parameter 	S0=4'b0000, S5=4'b0001, S10=4'b0010, S15=4'b0011, S20=4'b0100, S25=4'b0101, S30=4'b0110, S35=4'b0111, S40=4'b1000, S45=4'b1001, S50=4'b1010, S55=4'b1011, S60=4'b1100;

always @ (posedge clk)
begin//state transistion
	if (reset)
		state <= S0;
	else
		case (state)
			S0:	if (nickle)
					state <= S5;
					else if (dime)
						state <= S10;
					else if (quarter)
						state <= S25;
			S5:	if (nickle)
						state <= S10;
					else if (dime)
						state <= S15;
					else if (quarter)
						state <= S30;
			S10:	if (nickle)
						state <= S15;
					else if (dime)
						state <= S20;
					else if (quarter)
						state <= S35;
			S15:	if (nickle)
						state <= S20;
					else if (dime)
						state <= S25;
					else if (quarter)
						state <= S40;
			S20:	if (nickle)
						state <= S25;
					else if (dime)
						state <= S30;
					else if (quarter)
						state <= S45;
			S25:	if (nickle)
						state <= S30;
					else if (dime)
						state <= S35;
					else if (quarter)
						state <= S50;
			S30:	if (nickle)
						state <= S35;
					else if (dime)
						state <= S40;
					else if (quarter)
						state <= S55;
			S35:	if (nickle)
						state <= S40;
					else if (dime)
						state <= S45;
					else if (quarter)
						state <= S60;
			S40:	if (cnt <4)
						begin
							state <= S40;
							cnt <= cnt + 1;
						end
					else
						begin
							state <= S0;
							cnt <= 0;
						end
			S45:	if (cnt <4)
						begin
							state <= S45;
							cnt <= cnt + 1;
						end
					else
						begin
							state <= S0;
							cnt <= 0;
						end
			S50:	if (cnt <4)
						begin
							state <= S50;
							cnt <= cnt + 1;
						end
					else
						begin
							state <= S0;
							cnt <= 0;
						end
			S55:	if (cnt <4)
						begin
							state <= S55;
							cnt <= cnt + 1;
						end
					else
						begin
							state <= S0;
							cnt <= 0;
						end
			S60:	if (cnt <4)
						begin
							state <= S60;
							cnt <= cnt + 1;
						end
					else
						begin
							state <= S0;
							cnt <= 0;
						end
			default:	state <= S0;
		endcase
end

always @ (state)
begin //output at each state
	case (state)
		S0:	begin 
				item = 1'b0; 
				change = 1'b0; 
				end
		S5:	begin 
				item = 1'b0; 
				change = 1'b0; 
				end
		S10:	begin 
				item = 1'b0; 
				change = 1'b0; 
				end
		S15:	begin 
				item = 1'b0; 
				change = 1'b0; 
				end
		S20:	begin 
				item = 1'b0; 
				change = 1'b0; 
				end
		S25:	begin 
				item = 1'b0; 
				change = 1'b0; 
				end
		S30:	begin 
				item = 1'b0; 
				change = 1'b0; 
				end
		S35:	begin 
				item = 1'b0; 
				change = 1'b0; 
				end
		S40:	begin 
				item = 1'b1; 
				change = 1'b0; 
				end
		S45:	begin 
				item = 1'b1; 
				change = 1'b1; 
				end
		S50:	begin 
				item = 1'b1; 
				change = 1'b1; 
				end
		S55:	begin 
				item = 1'b1; 
				change = 1'b1; 
				end
		S60:	begin 
				item = 1'b1; 
				change = 1'b1; 
				end
		default:	begin 
					item = 1'b0; 
					change = 1'b0; 
					end
	endcase
end
endmodule
