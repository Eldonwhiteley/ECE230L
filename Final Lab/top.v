module top
#(
    parameter DIVIDE_BY = 50000 // Use this when passing in to your clock div!
    // The test bench will set it appropriately for testing
    // DIVIDE_BY was originaly 17
)
(
    input [7:0] sw, // A and B
    input clk, // 100 MHz board clock
    input btnC, // Reset
    output [3:0] an, // 7seg anodes
    output [6:0] seg // 7seg segments
);

wire en;
wire [3:0] AplusB, AminusB;

clock_div clock(clk, btnC, en);

seven_seg_scanner scanner(en, btnC, an);

math_block math(sw[3:0], sw[7:4], AplusB, AminusB);

seven_seg_decoder decoder(sw[3:0], sw[7:4], AplusB, AminusB, an, seg);


    // Instantiate the clock divider...
    // ... wire it up to the scanner
    // ... wire the scanner to the decoder

    // Wire up the math block into the decoder

    // Do not forget to wire up resets!!

endmodule