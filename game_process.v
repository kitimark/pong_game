module game_process(
    matrix_out,
    player_top,
    player_down,
    count,
    clk
);

parameter SIZE = 2;
parameter WIDTH = 8;

output[15:0] matrix_out;
reg[15:0] matrix_out;

input[2:0] player_top, player_down;

input clk;
input[2:0] count;

integer i;

always @ (posedge clk)
begin
	matrix_out = 0;
    // top player
	if(count == 0)begin
        for(i = 0; i < WIDTH; i = i + 1)begin
        	matrix_out[WIDTH - i - 1] = (player_top-1 < i && player_top+SIZE > i) ? 1 : 0;
			if(player_top == 6)begin
				matrix_out[1:0] = 2'b11;
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
	end

end

endmodule // game_process
