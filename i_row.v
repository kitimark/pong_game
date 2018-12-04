module i_row(
    i_out,
	count,
    clk
);

parameter ROW = 4;
parameter BIT_COUNT = 2; // log2(ROW)

input clk;
input [BIT_COUNT-1:0] count;

output [ROW-1:0] i_out;

reg [ROW-1:0] i_out;

integer i;

always @ (posedge clk)
begin 
    for (i = 0; i < ROW ; i = i + 1) begin
        i_out[i] = (i == count) ? 1 : 0;
    end
end

endmodule // i_row
