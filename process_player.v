module process_player(
    out,
    count,
    clk
);

output[15:0] out;
reg[15:0] out;

input clk;
input [2:0] count;

reg[63:0] memory;

always @ (posedge clk)
begin
    case (count[2:1])
        0 : out = 16'h8100;
        1 : out = 16'h0000;
        2 : out = 16'h0000;
        3 : out = 16'h0081; 
    endcase
end

endmodule // process_player
