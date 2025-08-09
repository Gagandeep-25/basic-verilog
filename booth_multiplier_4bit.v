module booth_multiplier_4bit (
    input signed [3:0] A,
    input signed [3:0] B,
    output reg signed [7:0] Product
);
    reg signed [4:0] ACC;
    reg signed [3:0] M, Q;
    reg Q_1;
    integer i;

    always @(*) begin
        M = A;
        Q = B;
        Q_1 = 1'b0;
        ACC = 5'd0;

        for (i = 0; i < 4; i = i + 1) begin
            case ({Q[0], Q_1})
                2'b01: ACC = ACC + M;
                2'b10: ACC = ACC - M;
                default: ;
            endcase
            {ACC, Q, Q_1} = {ACC[4], ACC, Q, Q_1} >>> 1;  // Arithmetic shift
        end

        Product = {ACC[3:0], Q};
    end
endmodule
