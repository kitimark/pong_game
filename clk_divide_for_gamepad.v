module clk_divide_for_gamepad(
    clk_div,
    clk
);

input clk;
output clk_div;

reg clk_div;
reg[6:0] state;

always @ (posedge clk)
begin
    state = state + 1;
	if(state == 0)begin
		clk_div = ~clk_div;
	end
end

endmodule // clk_div
