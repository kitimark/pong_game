module game_process(
    matrix_out,
    x_pos,
    y_pos,
    player_top,
    player_down,
    count,
	testled,
    clk
);

parameter SIZE = 2;
parameter WIDTH = 8;
parameter BIT_OF_WIDTH = 3;

output[15:0] matrix_out;
reg[15:0] matrix_out;

input[2:0] player_top, player_down;

input[BIT_OF_WIDTH-1:0] x_pos, y_pos;

input clk, testled;
input[2:0] count;

always @ (posedge clk)
begin
	matrix_out = 0;
    // top player
	if(count == 0)begin
        case(player_top)
            0 : matrix_out = 8'b00000011; 
            1 : matrix_out = 8'b00000110; 
            2 : matrix_out = 8'b00001100; 
            3 : matrix_out = 8'b00011000; 
            4 : matrix_out = 8'b00110000; 
            5 : matrix_out = 8'b01100000; 
            6 : matrix_out = 8'b11000000; 
            7 : matrix_out = 0;
        endcase
	end
    // down player
	if(count == 7)begin
        case (player_down)
            0 : matrix_out = 8'b00000011; 
            1 : matrix_out = 8'b00000110; 
            2 : matrix_out = 8'b00001100; 
            3 : matrix_out = 8'b00011000; 
            4 : matrix_out = 8'b00110000; 
            5 : matrix_out = 8'b01100000; 
            6 : matrix_out = 8'b11000000; 
			7 : matrix_out = 0;
        endcase
	end
	// ball
    if(count == y_pos) begin
        case (x_pos)
            0 :  matrix_out = matrix_out | 8'b00000001;
            1 :  matrix_out = matrix_out | 8'b00000010;  
            2 :  matrix_out = matrix_out | 8'b00000100;
            3 :  matrix_out = matrix_out | 8'b00001000;
            4 :  matrix_out = matrix_out | 8'b00010000;
            5 :  matrix_out = matrix_out | 8'b00100000;
            6 :  matrix_out = matrix_out | 8'b01000000;
            7 :  matrix_out = matrix_out | 8'b10000000;
        endcase
    end
	if(testled) begin
		matrix_out = 8'b11111111;
	end
end

endmodule // game_process
