`timescale 1ns / 1ps

module one_pulse_module(clk, PB_debounced, PB_single_pulse);
	input clk, PB_debounced;
	output reg PB_single_pulse;
	
	reg PB_debounced_delay = 1;
	
	always@(posedge clk) begin
		if (PB_debounced == 1 && PB_debounced_delay==0)
			PB_single_pulse = 1;
		else
			PB_single_pulse = 0;
		
		PB_debounced_delay = PB_debounced;
	end


endmodule
