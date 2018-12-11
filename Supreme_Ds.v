module supreme_Ds(
left_op   ,// Left output
right_op  ,// Right output
in_p[2:0]  ,// "0" , "1" , "2"
clk         //clk   
);
input[2:0] in_p;
input clk;
output left_op , right_op;
reg left_op , right_op;
reg[2:0] Next_s , Prev_s;
always @ (posedge clk)
begin
	left_op = 0;
	right_op = 0;
	Next_s = in_p[2:0]; 
	if (Next_s != 0 && Prev_s != 0)begin
		if(Next_s == 2 && Prev_s == 0) begin
			assign left_op = 1'b1; // output is left.
		end
		else if(Next_s == 0 && Prev_s == 2)begin
			assign right_op = 1'b1; // output is right.
		end
	end
		else begin
			if(Next_s > Prev_s) begin
				right_op = 1'b1; // output is right.
			end
			if(Next_s < Prev_s) begin
				left_op = 1'b1; // output is left.
			end
		end
			Prev_s = Next_s;
	end	
end 
