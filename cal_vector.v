module cal_vector(
    out_x,
    out_y,
    x_pos,
	y_pos
);

input[2:0] x_pos, y_pos;

output out_x, out_y;
reg out_x, out_y;

always @ (x_pos or y_pos)
begin
    case (x_pos)
        3'b000 : out_x = 0;
        3'b111 : out_x = 1; 
    endcase

    case (y_pos)
        3'b001 : out_y = 0;
        3'b110 : out_y = 1;
    endcase
end

endmodule // cal_vector
