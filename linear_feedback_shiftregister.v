module random_sequence_counter(
    input clk,
    input rst,
    output reg [3:0] rand_out
);
    reg [3:0] lfsr;

    always @(posedge clk or posedge rst) begin
        if (rst)
            lfsr <= 4'b1011; 
        else
            lfsr <= {lfsr[2:0], lfsr[3] ^ lfsr[2]}; 

        rand_out <= lfsr;
    end
endmodule



`timescale 1ns / 1ps
module tb_random_sequence_counter;
  reg clk;
  reg rst;
  wire [3:0] rand_out;
  random_sequence_counter uut (
    .clk(clk),
    .rst(rst),
    .rand_out(rand_out)
  );
  always #5 clk = ~clk;
  initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
    #200 $finish;
  end
  initial begin
    $monitor("Time = %0t, Random sequence = %b", $time, rand_out); 
  end
endmodule
