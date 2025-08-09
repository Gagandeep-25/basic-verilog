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





`timescale 1ns / 1ps
module T_flipflop_tb;
reg T, clk;
wire Q, Q_bar;

 T_flipflop uut (
    .T(T),
    .clk(clk),
    .Q(Q),
    .Q_bar(Q_bar)
  );
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk; 
  end
  
  initial begin
    $dumpfile("T_flipflop_tb.vcd");
    $dumpvars(0, T_flipflop_tb);

   
    T = 0; #10; 
    T = 1; #10; 
    T = 0; #10; 
    T = 1; #10; 
    T = 0; #10;
    T = 1; #10; 
    #20;
    $finish;
  end
endmodule

