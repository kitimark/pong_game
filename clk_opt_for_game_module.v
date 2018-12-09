module clk_opt_for_game_module(
    clk_opt,
    clk
);

output clk_opt;
reg clk_opt;

input clk;

always @ (posedge clk)
begin
    clk_opt = clk_opt + 1;
end

endmodule // clk_divide_for_game_module
