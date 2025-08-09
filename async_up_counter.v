module async_up_counter(
      input clk,
    input rst,
    output reg [2:0] q
    );
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 3'b000;
        else
            q <= q + 1;
    end
endmodule




`timescale 1ns / 1ps
module async_ctr_tb;
 reg clk, rst;
    wire [2:0] q;
    async_up_counter uut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end
    initial begin
        rst = 1;
        #10 rst = 0;

        #100 $finish;
    end
    initial begin
        $monitor("Time=%0t | Reset=%b | Count=%b", $time, rst, q);
    end
    
endmodule
