module find_cand(
	collide          , 
	player_pos_top   ,
	player_pos_down  ,
	player_pos_left  ,
	player_pos_right , 
	pos              , // ball position "8" (x,y)
	clk		// "1"
);

parameter WIDTH = 16;
parameter BIT_OF_WIDTH = 4;

input clk;
input[BIT_OF_WIDTH-1:0] pos , player_pos_down , player_pos_left ,player_pos_right , player_pos_top;

wire[BIT_OF_WIDTH-1:0] x_pos, y_pos;  
assign x_pos = pos[3:2];
assign y_pos = pos[1:0];

output[1:0] collide;
reg[1:0] collide;
reg x_collide , y_collide;
integer i , ans;

always @ (posedge clk)
begin
	if(x_pos == 1)begin //Left candidate
		for (i = 0; i < player_pos_left + 4 ; i = i+1 ) begin
		  		ans = (i>y_pos)?(i-y_pos):(i-y_pos); 
				  if(ans <= 1 ) y_collide = 1'b1;
				  else y_collide = 0'b0;
		end
		
	end
	if(x_pos == 14 && y_pos == 1)begin //Right candidate
		for (i = player_pos_right ; i < player_pos_right + 4 ; i = i+1 ) begin
		  		ans = (i>y_pos)?(i-y_pos):(i-y_pos); 
				  if(ans <= 1 ) y_collide = 1'b1;
				  else y_collide = 0'b0;
		end
	end
	if(x_pos == 1 && y_pos == 14)begin //Down candidate
		for (i = player_pos_down ; i < player_pos_down + 4 ; i = i+1 ) begin
		  		ans = (i>x_pos)?(i-x_pos):(i-x_pos); 
				if(ans <= 1 ) x_collide = 1'b1;
		        else x_collide = 0'b0;
		end
	end
	if(y_pos ==1)begin//Top candidate
		for (i = player_pos_top ; i < player_pos_top + 4 ; i = i+1 ) begin
		  		ans = (i>x_pos)?(i-x_pos):(i-x_pos);
				if(ans <= 1 ) x_collide = 1'b1;
		        else x_collide = 0'b0; 
		end
		
	end
	collide = {x_collide,y_collide};
end
endmodule
