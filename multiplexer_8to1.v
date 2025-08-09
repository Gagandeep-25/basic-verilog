module mux8to1(
    input [7:0] in,
    input [2:0] sel,
    output reg out
    );
     always @(*) begin
        case (sel)
            3'b000: out = in[0];
            3'b001: out = in[1];
            3'b010: out = in[2];
            3'b011: out = in[3];
            3'b100: out = in[4];
            3'b101: out = in[5];
            3'b110: out = in[6];
            3'b111: out = in[7];
            default: out = 1'b0;
        endcase
    end
endmodule




`timescale 1ns / 1ps
module mux8to1_tb;
    reg [7:0] in;
    reg [2:0] sel;
    wire out;    
    mux8to1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );
    initial begin        
        in = 8'b11010101; 
        for (sel = 0; sel < 8; sel = sel + 1) begin
            #10;  
            $display("sel = %b, output = %b", sel, out);
        end
        #10;
        $finish; 
    end
endmodule
