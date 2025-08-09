module ALU_4bit(
    input [3:0] A,
    input [3:0] B,
    input [2:0] Op,
    output reg [3:0] Result,
    output reg Zero,
    output reg Carry
    );
    
parameter ADD  = 3'b000;
parameter SUB  = 3'b001;
parameter AND  = 3'b010;
parameter OR   = 3'b011;
parameter XOR  = 3'b100;
parameter NOT  = 3'b101;
parameter NAND = 3'b110;
parameter NOR  = 3'b111;

wire [4:0] temp;
assign temp = (Op == ADD) ? (A + B) : 
              (Op == SUB) ? (A - B) : 5'b0;  
              
always @(*) begin 
Carry = 1'b0;
Zero = 1'b0;

case (Op)
            ADD: begin
                Result = temp[3:0];
                Carry = temp[4];
            end
            SUB: begin
                Result = temp[3:0];
                Carry = temp[4];
            end
            AND:  Result = A & B;
            OR:   Result = A | B;
            XOR:  Result = A ^ B;
            NOT:  Result = ~A;
            NAND: Result = ~(A & B);
            NOR:  Result = ~(A | B);
            default: Result = 4'b0000;
        endcase
        Zero = (Result == 4'b0000) ? 1'b1 : 1'b0;
    end              
endmodule
