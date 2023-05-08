module pingpong (
    input clk,  
    input rst,  
    output reg [7:0] leds  
);

reg [7:0] ball_pos;  
reg [7:0] player_A_pos;  
reg [7:0] player_B_pos;  
reg ball_dir;  // Ball direction (0 = left, 1 = right)
reg hit;  // Flag to indicate a paddle hit


initial begin
    ball_pos = 0;
    player_A_pos = 128;
    player_B_pos = 128;
    ball_dir = 1;
    hit = 0;
end

// Update paddle positions based on input from switches
always @(posedge clk) begin
    if (!rst) begin
        player_A_pos <= 128;
        player_B_pos <= 128;
    end else begin
        if (sw[0]) begin  // Move paddle A up
            if (player_A_pos > 0)
                player_A_pos <= player_A_pos - 1;
        end
        if (sw[1]) begin  // Move paddle A down
            if (player_A_pos < 255)
                player_A_pos <= player_A_pos + 1;
        end
        if (sw[2]) begin  // Move paddle B up
            if (player_B_pos > 0)
                player_B_pos <= player_B_pos - 1;
        end
        if (sw[3]) begin  // Move paddle B down
            if (player_B_pos < 255)
                player_B_pos <= player_B_pos + 1;
        end
    end
end

// Update ball position and check for collisions
always @(posedge clk) begin
    if (!rst) begin
        ball_pos <= 0;
        ball_dir <= 1;
        hit <= 0;
    end else begin
        // Update ball position based on direction
        if (ball_dir)
            ball_pos <= ball_pos + 1;
        else
            ball_pos <= ball_pos - 1;
        
        // Check for collisions with paddles
        if ((ball_pos == player_A_pos && !ball_dir) ||
            (ball_pos == player_B_pos && ball_dir)) begin
            ball_dir <= ~ball_dir;
            hit <= 1;
        end
        
        // Check for collisions with walls
        if (ball_pos == 0)
            ball_dir <= 1;
        if (ball_pos == 255)
            ball_dir <= 0;
    end
end

// Update LED output based on game variables
always @(posedge clk) begin
    if (!rst) begin
        leds <= 0;
    end else begin
        if (hit)
            leds <= {1, ball_pos};
        else
            leds <= {ball_dir, ball_pos};
    end
end

endmodule
