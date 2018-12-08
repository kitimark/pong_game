module matrix_count(
    count_row,
    clk
);

parameter ROW = 8;
parameter BIT_COUNT = 3; // log2(ROW)

input clk;

output [BIT_COUNT-1:0] count_row;
reg [BIT_COUNT-1:0] count_row;

always @ (posedge clk)
begin
    count_row = count_row + 1;
end

endmodule // matrix_count
