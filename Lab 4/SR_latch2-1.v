/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #4             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 4 - 8-Bit Register                                           ***
***                                                                         ***
*******************************************************************************
*** Filename: SR_latch2.v   Created by Jose Luis Martinez, Febuary 22, 2021 ***
***                                                                         ***
******************************************************************************/

`include "definitions.v"


module SR_latch2(Q, Q_bar, s0, s1, r0, r1);
	output Q, Q_bar;
	input s0, s1, r0, r1;

	parameter DELAY_1 = 0;
	parameter DELAY_2 = 0;

	nand #(DELAY_1) NAND1(Q, s0, s1, Q_bar);
	nand #(DELAY_2) NAND2(Q_bar, r0, r1, Q);

endmodule

