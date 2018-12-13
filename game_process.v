module game_process(
    matrix_out,
	pos_ball,
    player_top,
    player_down,
	a_longggggg,
	player,
    count,
    clk
);

parameter SIZE = 2;
parameter WIDTH = 8;
parameter BIT_OF_WIDTH = 3;

output[7:0] matrix_out;
reg[7:0] matrix_out;

output[7:0] a_longggggg;
reg[7:0] a_longggggg;

output[1:0] player;
reg[1:0] player;

input[2:0] player_top, player_down;

input clk;
input[2:0] count;

reg[7:0] top_block, down_block;

input[BIT_OF_WIDTH*2-1:0] pos_ball;
wire[BIT_OF_WIDTH-1:0] x_pos, y_pos;

assign x_pos = pos_ball[5:3];
assign y_pos = pos_ball[2:0];

integer i;

always @ (posedge clk)
begin
	matrix_out = 0;
	a_longggggg = 0;
    // top player
	for(i = 0; i < WIDTH; i = i + 1)begin
		top_block[WIDTH - i - 1] = (player_top-1 < i && player_top+SIZE > i) ? 1 : 0;
		if(player_top == 6)begin
			top_block[1:0] = 2'b11;
		end
	end

    // down player
	for(i = 0; i < WIDTH; i = i + 1)begin
		down_block[i] = (player_down-1 < i && player_down+SIZE > i) ? 1 : 0;
		if(player_down == 6)begin
			down_block[7:6] = 2'b11;
		end
	end

	// top player
	if(y_pos == 1)begin
		for(i = 1; i < WIDTH-1; i = i + 1)begin
			if(i == x_pos)begin
				a_longggggg[0] = (x_pos == 0) ? 0 : top_block[i-1];
				a_longggggg[1] = top_block[i];
				a_longggggg[2] = (x_pos == 7) ? 0 : top_block[i+1];
			end
		end
		player = (a_longggggg == 0) ? 0 : 2'b01; 
	end
	if(y_pos == 6)begin
		for(i = 1; i < WIDTH-1; i = i + 1)begin
			if(i == x_pos)begin
				a_longggggg[5] = (x_pos == 0) ? 0 : down_block[i-1];
				a_longggggg[6] = down_block[i];
				a_longggggg[7] = (x_pos == 7) ? 0 : down_block[i+1];
			end
		end
		player = (a_longggggg == 0) ? 0 : 2'b10; 
	end
	if(count == 0)begin
		matrix_out = top_block;
	end
	if(count == 7)begin
		matrix_out = down_block;
	end
	
	//ball
	if(count == pos_ball[2:0]) begin
        for(i = 1; i < WIDTH-1; i = i + 1) begin
            matrix_out[i] = (pos_ball[5:3] == i) ? 1 : matrix_out[i];
        end
    end
end

endmodule // game_process
