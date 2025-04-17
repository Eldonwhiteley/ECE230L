module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);

adder_subtractor aPlusb(A,B,1'b0,AplusB);
adder_subtractor aMinusb(A,B,1'b1,AminusB);

endmodule