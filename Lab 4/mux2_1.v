/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #4             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 4 - 8-Bit Register                                           ***
***                                                                         ***
*******************************************************************************
*** Filename: mux2_1.v      Created by Jose Luis Martinez, Febuary 22, 2021 ***
***                                                                         ***
******************************************************************************/
`include "definitions.v"

module mux2_1 (OUT, A, B, SEL);
	input A, B, SEL;
	output OUT;
	wire A1, B1, NSEL;

	not #(`TIME_DELAY_1 + `FAN_OUT_1) NOT(NSEL, SEL);
	and #(`TIME_DELAY_2 + `FAN_OUT_1) AND1(A1, A, NSEL);
	and #(`TIME_DELAY_2 + `FAN_OUT_1) AND2(B1, B, SEL);
	or #(`TIME_DELAY_2 + `FAN_OUT_1) OR1(OUT, A1, B1);

endmodule