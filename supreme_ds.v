module supreme_ds(
left_op   ,// Left output
right_op  ,// Right output
in_p  ,// "0" , "1" , "2"
clk         //clk   
);
input[2:0] in_p;
input clk;
output left_op , right_op;
reg left_op , right_op;
reg[2:0] Next_s , Prev_s;
always @ (negedge clk)
begin
	left_op = 0;
	right_op = 0;
	Next_s = in_p[2:0]; 
	if(Next_s != Prev_s)begin
		if(Next_s == 3'b010 || Next_s == 3'b100 || Next_s == 3'b001)begin
			if(Next_s == 3'b100 && Prev_s == 3'b001) begin
				left_op = 1'b1; // output is left.
			end else if(Next_s == 3'b001 && Prev_s == 3'b100)begin
				right_op = 1'b1; // output is right.
			end else if(Next_s > Prev_s) begin
				right_op = 1'b1; // output is right.
			end else if(Next_s < Prev_s) begin
				left_op = 1'b1; // output is left.
			end
			Prev_s = Next_s;
		end
	end
end
endmodule
