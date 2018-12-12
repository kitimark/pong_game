module j_col(
    j_out,
    input_matrix,
    count_row,
    clk
);

parameter ROW = 8;
parameter COL = 8;
parameter BIT_COUNT = 3; // log2(ROW)

input clk;
input [7:0] input_matrix;

input [BIT_COUNT-1:0] count_row;

output [COL-1:0] j_out;

reg [COL-1:0] j_out;

integer i, j;

always @ (count_row)
begin
    j_out = ~input_matrix[7:0]; 
end

endmodule // j_col
