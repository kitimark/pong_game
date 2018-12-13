module pos_ball(
    x_pos, 
    y_pos,
    en,
    x_in,
    y_in,
	endgame,    
	clk
);

parameter WIDTH = 8;
parameter BIT_OF_WIDTH = 3;

input clk, en, endgame, x_in, y_in;

reg[9:0] state;

output[BIT_OF_WIDTH-1:0] x_pos, y_pos; 
reg[BIT_OF_WIDTH-1:0] x_pos, y_pos; 

always @ (negedge clk)
begin
	if(state == 0) begin
        if(endgame == 0) begin
            if(en)begin
                if(x_in == 0)begin
                    x_pos = x_pos + 1;
                end else begin
                    x_pos = x_pos - 1;
                end
                if(y_in == 0)begin
                    y_pos = y_pos + 1;
                end else begin
                    y_pos = y_pos - 1;
                end
            end else begin
                x_pos = 8'o2;
                y_pos = 8'o2;
            end
        end
	end

	state = state + 1;
end

endmodule // pos_ball
