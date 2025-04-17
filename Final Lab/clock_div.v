module clock_div
#(
    parameter DIVIDE_BY = 50000 // Default: 100MHz / 2(50000) = 1kHz
)
(
    input clock,
    input reset,
    output reg div_clock
);

integer counter;

initial begin
    div_clock = 0;
    counter = 0;
end

always @(posedge clock or posedge reset) begin
    if(reset) begin
        counter <= 0;
        div_clock <= 0;
    end else begin
        if (counter == (DIVIDE_BY - 1)) begin
            counter <= 0;
            div_clock <= ~div_clock;
        end else begin
            counter <= counter + 1;        
        end
    end    
end

endmodule