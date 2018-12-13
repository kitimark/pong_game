module cal_vector(
    new_vector,
    vector,
    player,
    action_top,
    action_down,
    clk
);

output[3:0] new_vector;
reg[3:0] new_vector;

input[3:0] vector;
input[2:0] player;

input[1:0] action_top;
input[1:0] action_down;

input clk;

wire[1:0] y_vector, x_vector;

always @ (posedge clk)
begin
    // top player
    if (player == 1) begin
        // y
        new_vector[1:0] = {~vector[1], vector[0]};
        if (action_top != 0) begin
            if(vector[3:2] == action_top)begin
                new_vector[3:2] = vector[3:2];
            end else if(vector[3:2] != action_top)begin
                case (action_top)
                    2'b01 : new_vector[3:2] = 
                  default: 
                endcase
            end
        end else begin
            new_vector[3:2] = vector[3:2];
        end
    end


    
    // down player
    if (player == 2) begin
        // y
        new_vector[1:0] = {~vector[1], vector[0]}; 
    end
end

endmodule // cal_vector
