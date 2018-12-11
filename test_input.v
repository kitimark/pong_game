module test_input(
    input_matrix,
    count,
    clk
);

output[15:0] input_matrix;
reg[15:0]  input_matrix;

input[3:0] count;
input clk;

always @ (input_matrix)
begin
    case (count)
        0 : input_matrix = 16'h1000;
        1 : input_matrix = 16'h0000;
        2 : input_matrix = 16'h0000;
        3 : input_matrix = 16'h0000;
        4 : input_matrix = 16'h0000;
        5 : input_matrix = 16'h0000;
        6 : input_matrix = 16'h0000;
        7 : input_matrix = 16'h0000;
        8 : input_matrix = 16'h0000;
        9 : input_matrix = 16'h0000;
        10 : input_matrix = 16'h0000;
        11 : input_matrix = 16'h0000;
        12 : input_matrix = 16'h0000;
        13 : input_matrix = 16'h0000;
        14 : input_matrix = 16'h0000;
        15 : input_matrix = 16'h0000;
    endcase
end

endmodule // input
