/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #8             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 8 - Arithmetic Logic Unit                                    ***
***                                                                         ***
*******************************************************************************
*** Filename: lab8_tb.v       Created by Jose Luis Martinez, April 16, 2021 ***
***                                                                         ***
******************************************************************************/

`include "definitions.v"

module lab8_tb();
	reg CLK, EN, OE;
	reg [3:0] OPCODE;

	`ifdef SIGNED
		reg signed [`WIDTH_TB-1:0]A, B;
		wire signed [`WIDTH_TB-1:0] ALU_OUT;
	`else
		reg [`WIDTH_TB-1:0]A, B;
		wire [`WIDTH_TB-1:0] ALU_OUT;
	`endif

	wire CF, ZF, SF, OF;

	alu #(.WIDTH(`WIDTH_TB)) alu1(.CLK(CLK), .EN(EN), .OE(OE), .OPCODE(OPCODE), .A(A), 
		  .B(B), .ALU_OUT(ALU_OUT), .CF(CF), .ZF(ZF), .SF(SF), .OF(OF));

	initial begin
		CLK <= 0;
		forever begin
			#(`CLK_PER/2) CLK <= ~CLK;
		end
	end

	initial begin
		$vcdpluson;
		EN <= 1;
		OE <= 1;
		A <= 8'b0000_0111;
		B <= 8'b0000_0111;
		OPCODE <= `ALU_ADD_TB;
		$strobe(`STRING, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		OPCODE <= `ALU_SUB_TB;
		$strobe(`STRING, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		B <= 8'b000_1000;
		$strobe(`STRING, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		OPCODE <= `ALU_ADD_TB;
		$strobe(`STRING, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		A <= 8'b1000_0000;
		B <= 8'b1000_1001;
		$strobe(`STRING, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		A <= 8'b1000_1010;
		B <= 8'b1000_1001;
		OPCODE <= `ALU_SUB_TB;
		#(`CLK_PER)
		OPCODE <= `ALU_ADD_TB;
		A <= 8'b1100_1010;
		B <= 8'b1100_1001;
		$strobe(`STRING, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		A <= 8'b1000_0001;
		B <= 8'b1100_1001;
		$strobe(`STRING, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		A <= 8'b1000_0001;
		B <= 8'b0011_0111;
		OPCODE <= `ALU_SUB_TB;
		$strobe(`STRING, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		$strobe(`STRING, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		OE <= 0;
		$strobe(`STRING, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		EN <= 0;
		$strobe(`STRING, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		$strobe(`STRING, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		OE <= 1;
		EN <= 1;
		OPCODE <= `ALU_ADD_TB;
		$strobe(`STRING, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		A <= 8'b1100_0001;
		B <= 8'b0111_0111;
		$strobe(`STRING, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		A <= 8'b0110_1001;
		B <= 8'b0101_0111;
		OPCODE <= `ALU_AND_TB;
		$strobe(`STRING, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		OPCODE <= `ALU_OR_TB;
		$strobe(`STRINGF, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		OPCODE <= `ALU_XOR_TB;
		$strobe(`STRINGF, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		OPCODE <= `ALU_NOT_TB;
		$strobe(`STRINGF, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		$strobe(`STRINGF, $time, OPCODE, A, B, EN, OE, CLK, CF, ZF, SF, OF, ALU_OUT);
		#(`CLK_PER)
		$finish;
	end

endmodule