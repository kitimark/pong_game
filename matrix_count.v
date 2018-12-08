module matrix_count(
    count_col,
    count_row,
    clk
);

parameter ROW = 8;
parameter BIT_COUNT = 3; // log2(ROW)

input clk;

output [BIT_COUNT-1:0] count_row;
reg [BIT_COUNT-1:0] count_row;

output[1:0] count_col;
reg[1:0] count_col;

always @ (posedge clk)
begin
    count_row = count_row + 1;
	case (count_row)
      7 : count_col = 0;  
      1 : count_col = 1;  
      3 : count_col = 2;
      5 : count_col = 3;
    endcase
end

endmodule // matrix_count
