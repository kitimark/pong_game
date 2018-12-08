module game_process(
    matrix_out,
    player_down,
    count,
    clk
);

parameter SIZE = 2;
parameter WIDTH = 8;

output[15:0] matrix_out;
reg[15:0] matrix_out;

input[2:0] player_down;

input clk;
input[2:0] count;

integer i;

always @ (posedge clk)
begin
	matrix_out = 0;
	if(count == 0)begin
		matrix_out[0] = 1;
		matrix_out[7] = 1;
	end
	if(count == 7)begin
    	for(i = 1; i < WIDTH-1; i = i + 1)begin
        	matrix_out[i] = (player_down-1 < i && player_down+SIZE > i) ? 1 : 0;
    	end
		matrix_out[0] = 1;
		matrix_out[7] = 1;
	end
end

endmodule // game_process
