module find_cand(
	contact          , 
	player_pos_top   ,
	player_pos_down  ,
	player_pos_left  ,
	player_pos_right , 
	pos              , // ball position "8" (x,y)
	clk		// "1"
);

parameter WIDTH = 8;
parameter BIT_OF_WIDTH = 3;
parameter size = 2;

input clk;
input[3:0] player_pos_down , player_pos_left ,player_pos_right , player_pos_top;
input[BIT_OF_WIDTH*2-1:0] pos ;

wire[BIT_OF_WIDTH-1:0] x_pos, y_pos;  
assign x_pos = pos[5:3];
assign y_pos = pos[2:0];

output[1:0] contact;
reg x_contact , y_contact;
assign contact = {x_contact , y_contact};
reg[1:0] ans;


always @ (posedge clk)
begin
	if(x_pos == 1)begin //Left candidate
		ans[0] <= (player_pos_left > y_pos)?(player_pos_left - y_pos):(y_pos-player_pos_left);
		ans[1] <= (player_pos_left + 1 > y_pos)?(player_pos_left + 1 - y_pos):(y_pos-player_pos_left + 1);
		if(ans[0] <= 1 || ans[1] <= 1) y_contact = 1'b1;
			else  y_contact = 0'b0;
	end
	if(x_pos == 6 && y_pos == 1)begin //Right candidate
		ans[0] <= (player_pos_right > y_pos)?(player_pos_right - y_pos):(y_pos-player_pos_right);
		ans[1] <= (player_pos_right + 1 > y_pos)?(player_pos_right + 1 - y_pos):(y_pos-player_pos_right + 1);
		if(ans[0] <= 1 || ans[1] <= 1) y_contact = 1'b1;
			else  y_contact = 0'b0;
	end
	if(x_pos == 1 && y_pos == 6)begin //Down candidate
		ans[0] <= (player_pos_down > x_pos)?(player_pos_down - x_pos):(x_pos-player_pos_down);
		ans[1] <= (player_pos_down + 1 > x_pos)?(player_pos_down + 1 - x_pos):(x_pos-player_pos_down + 1);
		if(ans[0] <= 1 || ans[1] <=1) x_contact = 1'b1;
			else  x_contact = 0'b0;
	end
	if(y_pos ==1)begin//Top candidate
		ans[0] <= (player_pos_top > x_pos)?(player_pos_top - x_pos):(x_pos-player_pos_top);
		ans[1] <= (player_pos_top + 1 > x_pos)?(player_pos_top + 1 - x_pos):(x_pos-player_pos_top + 1);
		if(ans[0] <= 1 || ans[1 <= 1]) x_contact = 1'b1;
			else  x_contact = 0'b0;
	end
	
end
endmodule
