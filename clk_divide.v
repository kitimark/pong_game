module clk_divide(
    clk_div,
    clk
);

input clk;
output clk_div;

integer state;
initial state = 1;

reg clk_div;
always @ (posedge clk)
begin
    if (state == 1) begin
        clk_div = ~clk_div;
    end

    if (state == 3000) begin // FPS = 1 / FPS * 500000
        state = 0;
    end
    state = state + 1;
end

endmodule // clk_div