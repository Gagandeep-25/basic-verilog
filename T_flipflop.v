module T_flipflop(
    input T,
    input clk,
    output reg Q,
    output reg Q_bar
);
    always @(posedge clk) begin
        if (T == 0) begin
            Q <= Q;           // Maintain the same state
            Q_bar <= ~Q;
        end else begin
            Q <= ~Q;          // Toggle state
            Q_bar <= ~Q;
        end
    end
endmodule
