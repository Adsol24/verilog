module vending_machine_top_lvl(CLK, RESET, PB, ITEM, CHANGE);

input CLK, RESET, PB1, PB2, PB3;
output ITEM, CHANGE;
wire clk_1Hz_w;
wire pb_w;
wire pb_w2;
wire pb_w3;

clock_divide_module(
.clk_50Mhz (CLK), 
.clk_1Hz (clk_1Hz_w)
);

one_pulse_module(
.clk(clk_1Hz_w), 
.PB_debounced(PB1), 
.PB_single_pulse(pb_w)
);

one_pulse_module(
.clk(clk_1Hz_w), 
.PB_debounced(PB2), 
.PB_single_pulse(pb_w2)
);

one_pulse_module(
.clk(clk_1Hz_w), 
.PB_debounced(PB3), 
.PB_single_pulse(pb_w3)
);

VM(
.nickle(pb_w), 
.dime(pb_w2), 
.quarter(pb_w3), 
.clk(clk_1Hz_w), 
.reset(RESET), 
.item(ITEM), 
.change(CHANGE)
);
endmodule 
