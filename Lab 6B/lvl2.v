/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #6B            Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 6B - Sum of Products                                         ***
***                                                                         ***
*******************************************************************************
*** Filename: lvl2.v           Created by Jose Luis Martinez, April 1, 2021 ***
***                                                                         ***
******************************************************************************/

`timescale 1ns/100ps

module lvl2(SUM_OUT, REG_OUT, A, B, C, CLK, RST);
	parameter SIZE = 4;

	input CLK, RST;
	input [SIZE-1:0] A;
	input [SIZE-1:0] B;
	input [SIZE-1:0] C;
	output [SIZE-1:0] REG_OUT;
	output [SIZE*2:0] SUM_OUT;

	wire [SIZE-1:0] r1r2; 
	wire [(SIZE*2)-1:0] prod1; 
	wire [(SIZE*2)-1:0] prod2;

	sca_reg #(.SIZE(SIZE)) sr1(.OUT(r1r2), .A(A), .RST(RST), .CLK(CLK));
	sca_reg #(.SIZE(SIZE)) sr2(.OUT(REG_OUT), .A(r1r2), .RST(RST), .CLK(CLK));

	sca_mult #(.SIZE(SIZE)) mult1(.OUT(prod1), .A(r1r2), .B(B));
	sca_mult #(.SIZE(SIZE)) mult2(.OUT(prod2), .A(REG_OUT), .B(C));

	sca_add #(.SIZE(SIZE*2)) add1(.OUT(SUM_OUT), .A(prod1), .B(prod2));
endmodule