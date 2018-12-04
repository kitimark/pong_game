module matrix_count(
    count,
    clk
);

parameter ROW = 4;
parameter BIT_COUNT = 2; // log2(ROW)

input clk;

output [BIT_COUNT-1:0] count;

reg [BIT_COUNT-1:0] count;

always @ (posedge clk)
begin
    count = count + 1;
end

endmodule // matrix_count