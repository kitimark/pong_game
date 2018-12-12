module game_process(
    matrix_out,
    player_top,
    player_down,
    player_right,
    player_left,
    pos_ball,
	a_longggggg,
    count,
    clk
);

parameter SIZE = 2;
parameter WIDTH = 8;
parameter BIT_OF_WIDTH = 3;

output[15:0] matrix_out;
reg[15:0] matrix_out;

output[7:0] a_longggggg;
reg[7:0] a_longggggg;

input[2:0] player_top, player_down, player_right, player_left;

input[BIT_OF_WIDTH*2-1:0] pos_ball;
wire[BIT_OF_WIDTH-1:0] x_pos, y_pos;

assign x_pos = pos_ball[5:3];
assign y_pos = pos_ball[2:0];

input clk;
input[2:0] count;

integer i;

always @ (posedge clk)
begin
	matrix_out = 0;
	a_longggggg = 0;
    // right player
    matrix_out[7] = (WIDTH-player_right-3 < count && WIDTH-player_right+SIZE-2 > count) ? 1 : 0;
    // left player
    matrix_out[0] = (player_left-1 < count && player_left+SIZE > count) ? 1 : 0;
    // top player
	if(count == 0)begin
        for(i = 0; i < WIDTH; i = i + 1)begin
        	matrix_out[WIDTH - i - 1] = (player_top-1 < i && player_top+SIZE > i) ? 1 : 0;
			if(player_top == 6)begin
				matrix_out[1:0] = 2'b11;
			end
    	end
        // conner
		matrix_out[0] = 1;
		matrix_out[7] = 1;
		// around of the ball
		if(y_pos == 1)begin
			for(i = 1; i < WIDTH-1; i = i + 1)begin
				if(i == x_pos)begin
					a_longggggg[0] = matrix_out[i-1];
					a_longggggg[1] = matrix_out[i];
					a_longggggg[2] = matrix_out[i+1];
				end
			end
		end
	end
    // down player
	if(count == 7)begin
    	for(i = 0; i < WIDTH; i = i + 1)begin
        	matrix_out[i] = (player_down-1 < i && player_down+SIZE > i) ? 1 : 0;
			if(player_down == 6)begin
				matrix_out[7:6] = 2'b11;
			end
    	end
        // conner
		matrix_out[0] = 1;
		matrix_out[7] = 1;
		// around of the ball
		if(y_pos == 6)begin
			for(i = 1; i < WIDTH-1; i = i + 1)begin
				if(i == x_pos)begin
					a_longggggg[5] = matrix_out[i-1];
					a_longggggg[6] = matrix_out[i];
					a_longggggg[7] = matrix_out[i+1];
				end
			end
		end
	end

end

endmodule // game_process
