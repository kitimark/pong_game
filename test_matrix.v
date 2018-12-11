module test_matrix(
    j_out,
	input_matrix,
    count,
    clk
);

output[1:0] j_out;
reg[3:0] j_out;

input[15:0]input_matrix;

input[1:0] count;
reg[3:0] i;

input clk;

always @ (posedge clk)
begin
	for(i = 0; i < 4; i = i + 1) begin
		if(i == count)begin
			j_out = {input_matrix[i], input_matrix[4+i], input_matrix[8+i], input_matrix[12+i]};
		end
	end
end

endmodule // test_matrix
