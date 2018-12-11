module game_process(
    matrix_out,
    player_top,
    player_down,
    player_right,
    player_left,
    pos_ball,
	test_led,
    count,
    clk
);

parameter SIZE = 4;
parameter WIDTH = 16;
parameter BIT_OF_WIDTH = 4;

output[15:0] matrix_out;
reg[15:0] matrix_out;

input[3:0] player_top, player_down, player_right, player_left;

input[BIT_OF_WIDTH*2-1:0] pos_ball;
wire[BIT_OF_WIDTH-1:0] x_pos, y_pos;

assign x_pos = pos_ball[5:3];
assign y_pos = pos_ball[2:0];

input clk, test_led;
input[BIT_OF_WIDTH-1:0] count;

integer i;

always @ (count)
begin
	matrix_out = 0;
    // right player
    matrix_out[15] = (WIDTH-player_right-3 < count && WIDTH-player_right+SIZE-2 > count) ? 1 : 0;
    // left player
    matrix_out[0] = (player_left-1 < count && player_left+SIZE > count) ? 1 : 0;
    // top player
	if(count == 0)begin
        for(i = 1; i < WIDTH-1; i = i + 1)begin
        	matrix_out[WIDTH - i - 1] = (player_top-1 < i && player_top+SIZE > i) ? 1 : 0;
    	end
        // conner
		matrix_out[0] = 1;
		matrix_out[15] = 1;
	end
    // down player
	if(count == 15)begin
    	for(i = 1; i < WIDTH-1; i = i + 1)begin
        	matrix_out[i] = (player_down-1 < i && player_down+SIZE > i) ? 1 : 0;
    	end
        // conner
		matrix_out[0] = 1;
		matrix_out[15] = 1;
	end
	// ball
    if(count == y_pos) begin
        for(i = 1; i < WIDTH-1; i = i + 1) begin
            matrix_out[i] = (x_pos == i) ? 1 : matrix_out[i];
        end
    end
	if(~test_led)begin
		matrix_out = 16'hFFFF;
	end
end

endmodule // game_process
