module convert_action(
    new_action,
    action
);

output[1:0] new_action;
reg[1:0] new_action;
input[1:0] action;

always @ (action)
begin
    case (action)
        2'b01: new_action = 2'b11;
        2'b11: new_action = 2'b01;
    endcase
end

endmodule // convert_action
