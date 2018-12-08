module j_col(
    j_out,
    input_matrix,
    count_row,
    clk
);

parameter ROW = 8;
parameter COL = 8;
parameter PIXEL = ROW*COL;
parameter BIT_COUNT = 3; // log2(ROW)

input clk;
input [15:0] input_matrix;

input [BIT_COUNT-1:0] count_row;

output [COL-1:0] j_out;

reg [COL-1:0] j_out;

integer i, j;

always @ (posedge clk)
begin
    for(j = 0; j < ROW; j = j + 1) begin // fix bit-select with non-constant 
		if (j == count_row) begin
            j_out = (j%2 == 0) ? ~input_matrix[7:0] : ~input_matrix[15:8]; 
        end
    end
end

endmodule // j_col
