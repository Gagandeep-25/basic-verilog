module full_adder(
    input A,
    input B,
    input Cin,
    output sum,
    output Cout
    );
     assign sum = A ^ B ^ Cin;
assign Cout = (A & B) | (Cin & (A ^ B));
endmodule


module fbfa(
    input A0, A1, A2, A3,
    input B0, B1, B2, B3,
    input Cin,
    output S0, S1, S2, S3,
    output C4
);
    wire C1, C2, C3;

    full_adder FA0(.A(A0), .B(B0), .Cin(Cin), .sum(S0), .Cout(C1));
    full_adder FA1(.A(A1), .B(B1), .Cin(C1), .sum(S1), .Cout(C2));
    full_adder FA2(.A(A2), .B(B2), .Cin(C2), .sum(S2), .Cout(C3));
    full_adder FA3(.A(A3), .B(B3), .Cin(C3), .sum(S3), .Cout(C4));
endmodule
