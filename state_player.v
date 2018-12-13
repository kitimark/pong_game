module state_player(
    state_left,
    Next_s,
    en,
    clk
);

parameter BIT_WIDTH = 3; // log2(WIDTH)
parameter SIZE = 2;
parameter START = 4;

input en, clk;
input[2:0] Next_s;
reg[2:0]Prev_s;

output[BIT_WIDTH-1:0] state_left;
reg[BIT_WIDTH-1:0] state_left;

always @ (posedge clk)
begin
    if(Next_s != Prev_s && (Next_s == 3'b010 || Next_s == 3'b100 || Next_s == 3'b001))begin
        if(en) begin
            if(Next_s == 3'b010 && Prev_s == 3'b100) begin
                if(state_left != 0) begin // left
                    state_left = state_left - 1;
                end
            end
            if(Next_s == 3'b010 && Prev_s == 3'b001) begin // right
                if(state_left != ~3'b0 - 1)begin
                state_left = state_left + 1;
                end
            end
        end else begin
            state_left = 3; 
        end
		Prev_s = Next_s;
    end
end

endmodule // mem_state_player
