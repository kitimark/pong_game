module clk_divide(
    clk_div,
    clk
);

input clk;
output clk_div;

reg[7:0] state;

reg clk_div;
always @ (posedge clk)
begin
    if (state == 0) begin
        clk_div = ~clk_div;
    end
    state = state + 1'b1;
end

endmodule // clk_div
