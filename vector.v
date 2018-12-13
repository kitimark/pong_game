module vector(
    out_vector,
    in_x,
    in_y
);

output[3:0] out_vector;
reg[3:0] out_vector;
input in_x, in_y;

always @ (in_x or in_y)
begin
    if(in_x == 0)begin
        out_vector[3:2] = 2'b01;
    end
    if(in_x == 1)begin
        out_vector[3:2] = 2'b11;
    end

    if(in_y == 0)begin
        out_vector[1:0] = 2'b01;
    end
    if(in_y == 1)begin
        out_vector[1:0] = 2'b11;
    end
end

endmodule // vector
