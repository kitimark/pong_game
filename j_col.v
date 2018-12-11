module j_col(
    j_out,
    input_matrix,
);

parameter ROW = 16;
parameter COL = 16;
parameter BIT_COUNT = 4; // log2(ROW)

input [COL-1:0] input_matrix;

output [COL-1:0] j_out;

wire [COL-1:0] j_out;

assign j_out = input_matrix; 

endmodule // j_col
