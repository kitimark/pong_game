module find_cand(
	plate , // top , bot , left , right "8"
	pos1   , // ball position "8" (x,y)
	pos   , // ball position "8" (x,y)
	clk		// "1"
);

parameter WIDTH = 16;
parameter BIT_OF_WIDTH = 4;

input clk;
input[3:0] pos;

wire[BIT_OF_WIDTH-1:0] x_pos, y_pos;  
reg[BIT_OF_WIDTH*2-1:0] pos;
assign pos = {x_pos, y_pos};

output[BIT_OF_WIDTH*2-1:0] pos1;
assign pos1 = {x_pos, y_pos};

wire[BIT_OF_WIDTH-1:0] x_plate, y_plate; 
output[BIT_OF_WIDTH*2-1:0] plate;
wire[BIT_OF_WIDTH*2-1:0] plate;
assign plate = x_plate;
assign plate = y_plate;

always @ (posedge clk)
begin
	if(x_pos == 1)begin //Left candidate
		x_plate = 1;
		y_plate = y_plate + 3;
	end
	if(x_pos == 14 , y_pos == 1)begin //Right candidate
		x_plate = 15;
		y_plate = y_plate + 3;
	end
	if(x_pos == 1 , y_pos == 14)begin //Down candidate
		y_plate = 15;
		x_plate = x_plate + 3;
	end
	if(y_pos ==1)begin//Top candidate
		y_plate = 1;
		x_plate = x_plate + 3;
	end
end

