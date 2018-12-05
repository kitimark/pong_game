module state_player(
    state_left,
    state_right,
    left,
    right,
    en,
    clk
);

parameter BIT_WIDTH = 2; // log2(WIDTH)
parameter SIZE = 1;
parameter START = 2;

input en, clk, left, right;

output[BIT_WIDTH-1:0] state_left, state_right;
reg[BIT_WIDTH-1:0] state_left, state_right;
reg[1:0] player_input;
reg clicked;

always @ (posedge clk)
begin
    // initial player_input
    player_input[1] = left;
    player_input[0] = right;

    // code
    if(!clicked) begin
        if(en) begin
            if(player_input == 2'b10 && state_left != 0) begin // left
                state_left = state_left - 1;
                state_right = state_right - 1;
                clicked = 1;
            end
            if(player_input == 2'b01 && state_right != BIT_WIDTH*2 - 1) begin // right
                state_left = state_left + 1;
                state_right = state_right + 1;
                clicked = 1;
            end
        end else begin
            state_left = START - 1; 
            state_right = START + SIZE - 2;
        end
    end

    if (clicked && player_input == 0) begin
        clicked = 0;
    end
end

endmodule // mem_state_player