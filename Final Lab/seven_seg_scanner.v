module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);

wire R_next, RC_next, LC_next, L_next;
wire R, RC, LC, L;

    dff Rdff(
        .Default(1'b0),
        .D(R_next),
        .clk(clock),
        .Q(R),
        .reset(reset)
     );
     
     dff RCdff(
        .Default(1'b1),
        .D(RC_next),
        .clk(clock),
        .Q(RC),
        .reset(reset)
     );
     
     dff LCdff(
        .Default(1'b1),
        .D(LC_next),
        .clk(clock),
        .Q(LC),
        .reset(reset)
     );
     
     dff Ldff(
        .Default(1'b1),
        .D(L_next),
        .clk(clock),
        .Q(L),
        .reset(reset)
     );
     
     assign anode = {L,LC,RC,R};
     
     assign R_next = RC;
     assign RC_next = LC;
     assign LC_next = L;
     assign L_next = R;
     
endmodule