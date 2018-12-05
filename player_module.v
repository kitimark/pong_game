module player_module(
    out,
    state_left,
    state_right,
    en
);

parameter WIDTH = 4;
parameter BIT_WIDTH = 2;

input [BIT_WIDTH-1:0] state_left, state_right;
input en;

output [WIDTH-1:0] out;
reg [WIDTH-1:0] out;

integer i;

always @ (en)
begin
    if(en) begin
        for (i = 0; i < WIDTH ; i = i + 1)begin
            out[WIDTH-i-1] = ((state_left < i && state_right > i) || i == state_left || i == state_right) ? 1 : 0;
            // fix state_left <= i && state_right >= i this expr can't use
        end
    end else begin
        for (i = 0; i < WIDTH ; i = i + 1 ) begin
            out[i] = 1;
        end
    end
end

endmodule // player_module
