// Implement one-hot state machine
module onehot (
    input w, clock, reset,
    output A, B, C, D, E,
    output z
    );
    
    wire A_next, B_next, C_next, D_next, E_next;
    wire A, B, C, D, E;
      
     dff Adff(
         .reset(reset),
        .Default(1'b1),
        .D(A_next),
        .clk(clock),
        .Q(A)
     );
     
     dff Bdff(
         .reset(reset),
        .Default(1'b0),
        .D(B_next),
        .clk(clock),
        .Q(B)
     );
     
     dff Cdff(
         .reset(reset),
        .Default(1'b0),
        .D(C_next),
        .clk(clock),
        .Q(C)
     );
     
     dff Ddff(
         .reset(reset),
        .Default(1'b0),
        .D(D_next),
        .clk(clock),
        .Q(D)
     );
     
     dff Edff(
         .reset(reset),
        .Default(1'b0),
        .D(E_next),
        .clk(clock),
        .Q(E)
     );
    
    assign z = C | E;
    
    assign A_next = 1'b0;
    assign B_next = (A & ~w) | (D & ~w) | (E & ~w);
    assign C_next = (B & ~w) | (C & ~w);
    assign D_next = (A & w) | (B & w) | (C & w);
    assign E_next = (D & w) | (E & w);
    
endmodule
