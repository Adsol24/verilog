`timescale 1ns / 1ps

module vga_logic(squares, color, pixel_row, pixel_col, red, green, blue);
	input [3:0] squares;
	input [2:0] color;

	input [10:0] pixel_row, pixel_col;
	
	
	output red, green, blue;
	
	reg sq0,sq1,sq2,sq3;
	
	parameter hsq_size = 100; 
	
	assign red = 	(sq0&&squares[0]&&color[2])||(sq1&&squares[1]&&color[2])||(sq2&&squares[2]&&color[2])||(sq3&&squares[3]&&color[2]);
	assign green = (sq0&&squares[0]&&color[1])||(sq1&&squares[1]&&color[1])||(sq2&&squares[2]&&color[1])||(sq3&&squares[3]&&color[1]);
	assign blue = 	(sq0&&squares[0]&&color[0])||(sq1&&squares[1]&&color[0])||(sq2&&squares[2]&&color[0])||(sq3&&squares[3]&&color[0]);
	

//Square 0
  always@(pixel_row, pixel_col) 
	 begin
		  if (160 <= pixel_col + hsq_size &&
		  160 + hsq_size >= pixel_col &&
 	     120 <= pixel_row + hsq_size &&
 	     120 + hsq_size >= pixel_row ) 
 		    sq0 <= 1;
 	     else
 		    sq0 <= 0;
  end


//Square 1
   always@(pixel_row, pixel_col) 
	 begin
		  if (460 <= pixel_col + hsq_size &&
		  460 + hsq_size >= pixel_col &&
 	     120 <= pixel_row + hsq_size &&
 	     120 + hsq_size >= pixel_row ) 
 		    sq1 <= 1;
 	     else
 		    sq1 <= 0;
  end

//Square 2
  always@(pixel_row, pixel_col) 
	 begin
		  if (160 <= pixel_col + hsq_size &&
		  160 + hsq_size >= pixel_col &&
 	     340 <= pixel_row + hsq_size &&
 	     340 + hsq_size >= pixel_row ) 
 		    sq2 <= 1;
 	     else
 		    sq2 <= 0;
  end

//Square 3
    always@(pixel_row, pixel_col) 
	 begin
		  if (460 <= pixel_col + hsq_size &&
		  460 + hsq_size >= pixel_col &&
 	     340 <= pixel_row + hsq_size &&
 	     340 + hsq_size >= pixel_row ) 
 		    sq3 <= 1;
 	     else
 		    sq3 <= 0;
  end
  
endmodule

