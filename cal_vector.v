module cal_vector(
    endgame,
    out_x,
    out_y,
    x_pos,
	y_pos,
    state_top,
    state_down
);

input[2:0] x_pos, y_pos;

input[2:0] state_top, state_down;

output out_x, out_y, endgame;
reg out_x, out_y, endgame;

always @ (x_pos or y_pos)
begin
    case (x_pos)
        3'b000 : out_x = 0;
        3'b111 : out_x = 1; 
    endcase

    case (y_pos)
        3'b001 : out_y = 0
        3'b110 : out_y = (state_down-1 < x_pos && state_down+2 > x_pos) ? 1 : 0;
		3'b111 : endgame = 1;
    endcase

end

endmodule // cal_vector
