module matrix_decoder(
    out,
    count,
    clk
);

output[15:0] out;
reg[15:0] out;

input clk;
input[1:0] count;


always @ (posedge clk)
begin
    case (count)
      0 : out = 16'hFFFF;
      1 : out = 16'h1818;
      2 : out = 16'h1818;
      3 : out = 16'h1818;
    endcase
end

endmodule // test_matrix
