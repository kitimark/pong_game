module state_player(
    state_left,
	action,
    left,
    right,
    en,
    clk
);

parameter BIT_WIDTH = 3; // log2(WIDTH)
parameter SIZE = 2;
parameter START = 4;

input en, clk, left, right;

output[BIT_WIDTH-1:0] state_left;
output[2:0] action;
reg[1:0] action;

reg[BIT_WIDTH-1:0] state_left;
reg clicked;

wire[1:0] player_input;
assign player_input = {left, right};

always @ (posedge clk)
begin
	action = 1'b00;
    if(!clicked) begin
        if(en) begin
            if(player_input == 2'b10 && state_left != 0) begin // left
                state_left = state_left - 1;
                clicked = 1;
				action = 2'b11;
            end
            if(player_input == 2'b01 && state_left != ~3'b0 - SIZE + 1) begin // right
                state_left = state_left + 1;
                clicked = 1;
				action = 2'b01;
            end
        end else begin
            state_left = START - 1; 
        end
    end

    if (clicked && player_input == 0) begin
        clicked = 0;
    end
end

endmodule // mem_state_player
