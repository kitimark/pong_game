module ball_hitPlate(
	next_pos   , // next x,y position 
  	pos        , // ball's position [4 bit x,y]
	player_pos , // player position [4 bit x,y]+4
	vector     , // {[1:0], y[1:0]}
	clk
);

parameter WIDTH = 16;
parameter BIT_OF_WIDTH = 4;

input clk;
input[3:0] pos , player_pos
	

