/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #6B            Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 6B - Sum of Products                                         ***
***                                                                         ***
*******************************************************************************
*** Filename: top_lvl.v        Created by Jose Luis Martinez, April 1, 2021 ***
***                                                                         ***
******************************************************************************/

`timescale 1ns/100ps

module top_lvl(OUT, D_IN, C0, C1, C2, C3, RST, CLK);
	parameter SIZE = 4;

	input RST, CLK;
	input [SIZE-1:0] D_IN;
	input [SIZE-1:0] C0;
	input [SIZE-1:0] C1;
	input [SIZE-1:0] C2;
	input [SIZE-1:0] C3;
	output [(SIZE*2)+1:0] OUT;

	wire [SIZE*2:0] sum1;
	wire [SIZE*2:0] sum2;
	wire [SIZE-1:0] rout1;
	wire [SIZE-1:0] rout2;

	lvl2 #(.SIZE(SIZE)) lvl2_1(.SUM_OUT(sum1), .REG_OUT(rout1), 
		                         .A(D_IN), .B(C0), .C(C1), .CLK(CLK), .RST(RST));
	lvl2 #(.SIZE(SIZE)) lvl2_2(.SUM_OUT(sum2), .REG_OUT(rout2), 
		                         .A(rout1), .B(C2), .C(C3), .CLK(CLK), .RST(RST));

	sca_add #(.SIZE((SIZE*2)+1)) add1(.OUT(OUT), .A(sum1), .B(sum2));

endmodule