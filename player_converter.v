module player_converter(
    out_for_matrix,
    down_player,
	test_dot,
	clk
);

parameter ROW = 4;
parameter COL = 4;

input clk, test_dot;
input[COL-1:0] down_player;
output[COL*ROW-1:0] out_for_matrix;
reg[COL*ROW-1:0] out_for_matrix;

always @ (posedge clk)
begin
	// fix bug missing source
	out_for_matrix = 16'h0000;
	// down-player
	out_for_matrix[ROW*COL-1:ROW*COL-4] = down_player;
end
endmodule // down_player_converter
