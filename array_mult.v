module array_mult(
    input [3:0] A,
    input [3:0] B,
    output [7:0] P
    );
        wire [3:0] pp0, pp1, pp2, pp3;  
    wire [7:0] temp1, temp2, temp3; 

   
    assign pp0 = A & {4{B[0]}};
    assign pp1 = A & {4{B[1]}};
    assign pp2 = A & {4{B[2]}};
    assign pp3 = A & {4{B[3]}};

   
    assign temp1 = {4'b0000, pp0};             
    assign temp2 = {3'b000, pp1, 1'b0};       
    assign temp3 = {2'b00, pp2, 2'b00};         
    assign P     = temp1 + temp2 + temp3 + {pp3, 4'b0000}; 
endmodule




`timescale 1ns / 1ps
module array_mult_tb;
    reg  [3:0] A, B;
    wire [7:0] P;
    array_mult uut (
        .A(A),
        .B(B),
        .P(P)
    );
    initial begin
        $monitor("A=%b, B=%b, P=%b", A, B, P);
        A = 4'b0011; B = 4'b0101; #10; // 3 x 5 = 15
        A = 4'b1111; B = 4'b1111; #10; // 15 x 15 = 225
        A = 4'b1010; B = 4'b0101; #10; // 10 x 5 = 50
        A = 4'b0001; B = 4'b1000; #10; // 1 x 8 = 8
        $stop;
    end
endmodule
