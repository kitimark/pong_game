module test_switch(
    clk_div,
    clk
);

input clk;

output clk_div;
reg clk_div;

reg[17:0] state;

always @ (posedge clk)
begin
    state = state + 1;
    if(state == 0) begin
        clk_div = ~clk_div;
    end
end

endmodule // test_switc 
