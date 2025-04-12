// Implement binary state machine
module binary(
    input w,
    input clk,
    output [2:0]State,
    output z
);

wire [2:0] State;
wire [2:0] Next;

dff zero (
    .reset(1'b0),
    .Default(1'b0),
    .D(Next[0]),
    .clk(clk),
    .Q(State[0])
);

dff one(
    .reset(1'b0),
    .Default(1'b0),
    .D(Next[1]),
    .clk(clk),
    .Q(State[1])
);

dff two(
    .reset(1'b0),
    .Default(1'b0),
    .D(Next[2]),
    .clk(clk),
    .Q(State[2])
);

assign z = (~State[2] & State[1] & ~State[0]) | (State[2] & ~State[1] & ~State[0]);

assign Next[0] = 
(~w & State[2] & ~State[1] & ~State[0]) |
(~w & ~State[2] & State[1] & State[0]) |
(~State[2] & ~State[1] & ~State[0]) | 
(w & ~State[1] & State[0]) |
(w & ~State[2] & ~State[0]);

assign Next[1] =
(w & ~State[2] & ~State[0]) | 
(State[1] & ~State[0]) |
(~State[1] & State[0]);


assign Next[2] =
(w & State[2]) |
(w & State[1] & State[0]);



//A = 000
//B = 001
//C = 010
//D = 011
//E = 100

endmodule
