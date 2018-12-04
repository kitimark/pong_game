module j_col(
    j_out,
    input_matrix,
    count,
    clk
);

parameter ROW = 4;
parameter COL = 4;
parameter PIXEL = ROW*COL;
parameter BIT_COUNT = 2; // log2(ROW)

input clk;
input [PIXEL-1:0] input_matrix;
input [BIT_COUNT-1:0] count;

output [COL-1:0] j_out;

reg [COL-1:0] j_out;

integer i, j;

always @ (posedge clk)
begin
    for(j = 0; j < count + 1; j = j + 1) begin // fix bit-select with non-constant 
        if (j == count) begin
            for(i = 0; i < COL; i = i + 1) begin
                j_out[i] = !input_matrix[j*COL+i];
            end
        end
    end
end

endmodule // j_col
