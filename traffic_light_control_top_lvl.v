module traffic_light_control_top_lvl(CLK_50MHz, red_out, green_out, blue_out, horiz_sync_out, vert_sync_out, video_on, pixel_clock);

input CLK_50MHz; 

output [9:0]red_out; 
   output [9:0]green_out;
   output [9:0] blue_out;
	output horiz_sync_out, vert_sync_out, video_on, pixel_clock;
	
	wire pixel_clock_w, clk5hz_w, red_w, green_w, blue_w;
	wire [2:0] color_w;
	wire [3:0] squares_w;
	wire [10:0] p_col_w;
	wire [10:0] p_row_w;
	
	assign pixel_clock = pixel_clock_w;
	
	clock_divide_module(CLK_50MHz, clk5hz_w);

	user_logic(pixel_clock_w, clk5hz_w, color_w, squares_w);
	
	vga_logic(squares_w, color_w, p_row_w, p_col_w, red_w, green_w, blue_w);
	
	vga_sync(CLK_50MHz, red_w, green_w, blue_w, 
	red_out, green_out, blue_out, horiz_sync_out, vert_sync_out, 
	video_on, pixel_clock_w, p_row_w, p_col_w);
endmodule

