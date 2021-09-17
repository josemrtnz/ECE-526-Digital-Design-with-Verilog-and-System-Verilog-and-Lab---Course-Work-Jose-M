/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #8             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 8 - Arithmetic Logic Unit                                    ***
***                                                                         ***
*******************************************************************************
*** Filename: alu.v           Created by Jose Luis Martinez, April 16, 2021 ***
***                                                                         ***
******************************************************************************/

`include "definitions.v"

module alu(CLK, EN, OE, OPCODE, A, B, ALU_OUT, CF, ZF, SF, OF);
	parameter WIDTH = 8;
	input CLK, EN, OE;
	input [3:0] OPCODE;

	`ifdef SIGNED
		input signed [WIDTH-1:0]A, B;
	`else
		input [WIDTH-1:0]A, B;
	`endif

	output [WIDTH-1:0]ALU_OUT;
	output CF, ZF, SF, OF;

	reg [WIDTH:0]temp;
	reg [WIDTH-1:0]A_temp, B_temp;
	reg [3:0] opcode_temp;
	wire [WIDTH-1:0]twos_complement_B;

	localparam ALU_SUM = 4'b0010;
	localparam ALU_SUB = 4'b0011;
	localparam ALU_AND = 4'b0100;
	localparam ALU_OR  = 4'b0101;
	localparam ALU_XOR = 4'b0110;
	localparam ALU_NOT = 4'b0111;

	assign twos_complement_B = ~B + 1'b1;

	assign ZF = (ALU_OUT == 0) ? 1 : 0;
	assign ALU_OUT = (OE&EN) ? temp[WIDTH-1:0] : {WIDTH{1'bz}};
	assign CF = (((opcode_temp == ALU_SUM) && temp[WIDTH]) || ((opcode_temp == ALU_SUB)
	            && A_temp<B_temp)) ? 1'b1 : 1'b0;
	assign SF = temp[WIDTH-1];
	assign OF = ((A_temp[WIDTH-1] == B_temp[WIDTH-1])&&(A_temp[WIDTH-1] != temp[WIDTH-1]) 
		        && (opcode_temp == ALU_SUM)) || ((A_temp[WIDTH-1] == twos_complement_B[WIDTH-1])
		        &&(A_temp[WIDTH-1] != temp[WIDTH-1]) && (opcode_temp == ALU_SUB))? 1'b1 : 1'b0;

	always@(posedge CLK) begin
		if(EN) begin
			A_temp <= A;
			B_temp <= B;
			opcode_temp <= OPCODE;
			case (OPCODE)
				ALU_SUM: begin
					temp <= A + B;
				end
				ALU_SUB: begin
					temp <= A + twos_complement_B;
				end
				ALU_AND: temp <= {1'b0, A & B};
				ALU_OR:  temp <= {1'b0, A | B};
				ALU_XOR: temp <= {1'b0, A ^ B};
				ALU_NOT: temp <= {1'b0, ~A};
				default: temp <= 0;
			endcase
		end
	end

endmodule

