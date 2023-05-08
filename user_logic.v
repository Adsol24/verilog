module user_logic(clk, push_buttons, dip_switch, color, squares);
	input clk;
	input [1:0] push_buttons;
	input [3:0] dip_switch;
	
	output [2:0] color = 1; // 001 ; r-0 g-0 b-1  (BLUE)
	output [3:0] squares;
	
	reg [2:0] color = 1;


	assign squares = dip_switch;
	
        always @(posedge clk)
         begin
           if (push_buttons[0])
			  color <=color +1;
			  else if (push_buttons[1])
			  color <= color - 1;
			  
			  else
			  color <=color;
           
           
         end
endmodule 

