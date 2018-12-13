module pos_ball(
    x_pos, 
    y_pos,
    en,
    vector, // {[1:0] x, [1:0] y}
    clk
);

parameter WIDTH = 8;
parameter BIT_OF_WIDTH = 3;

input clk, en;
input[3:0] vector;

reg[7:0] state;

output[BIT_OF_WIDTH-1:0] x_pos, y_pos; 
reg[BIT_OF_WIDTH-1:0] x_pos, y_pos; 

wire[1:0] x_vector, y_vector;
assign x_vector = vector[3:2];
assign y_vector = vector[1:0];

always @ (negedge clk)
begin
	if(state == 0) begin
    if(en)begin
        if(x_vector[1] == 0)begin
            x_pos = x_pos + x_vector[0];
        end else begin
            x_pos = x_pos - (~x_vector[0] + 1);
        end
        if(y_vector[1] == 0)begin
            y_pos = y_pos + y_vector[0];
        end else begin
            y_pos = y_pos - (~y_vector[0] + 1);
        end
    end else begin
        x_pos = 8'o3;
        y_pos = 8'o4;
    end
	end
	state = state + 1;
end

endmodule // pos_ball
