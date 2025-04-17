module top(
    input sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    // Hook up binary and one-hot state machines
onehot onehot (
    .w(sw),
    .clock(btnC),
    .reset(btnU),
    .z(led[0]),
    .A(led[2]),
    .B(led[3]),
    .C(led[4]),
    .D(led[5]),
    .E(led[6])
);

binary binary (
    .w(sw),
    .clk(btnC),
    .z(led[1]),
    .State(led[9:7]),
    .reset(btnU)
);
endmodule