module player_converter(
    out_for_matrix,
	top_player,
    down_player,
	clk
);

parameter ROW = 4;
parameter COL = 4;

input clk;
input[COL-1:0] top_player, down_player;
output[COL*ROW-1:0] out_for_matrix;
reg[COL*ROW-1:0] out_for_matrix;

integer i;

always @ (posedge clk)
begin
	// fix bug missing source
	out_for_matrix = 16'h0000;

	// top_player
	for (i = 0; i < COL; i = i + 1) begin
		out_for_matrix[i] = top_player[COL - i - 1];
	end

	// down_player
	out_for_matrix[ROW*COL-1:ROW*COL-4] = down_player;
end
endmodule // down_player_converter
