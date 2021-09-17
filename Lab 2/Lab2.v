/***************************************************************************
*** 																     ***
*** ECE 526 L Experiment #2             Jose Luis Martinez, Spring, 2021 ***
*** 																	 ***
*** Lab2                                                                 ***
***                                                                      ***
****************************************************************************
*** Filename: Lab2.v      Created by Jose Luis Martinez, Febuary 4, 2021 ***
***                                                                      ***
***************************************************************************/

`timescale 1 ns / 100 ps

`define PRIMARY_OUT   5
`define FAN_OUT_1     0.5
`define FAN_OUT_2	  1
`define TIME_DELAY_1  1
`define TIME_DELAY_2  2
`define TIME_DELAY_3  3

module Lab2_1 (in1, in2, out1);
	input in1, in2;
	output out1;

	wire NT, A1, A2;

	not #(`TIME_DELAY_1 + `FAN_OUT_2) NOT1(NT, in1);
	and #(`TIME_DELAY_2 + `FAN_OUT_1) AND1(A1, in2, in1);
	and #(`TIME_DELAY_2 + `FAN_OUT_1) AND2(A2, in1, NT);
	nand #(`TIME_DELAY_3 + `PRIMARY_OUT) NAND1(out1, NT, A1, A2);

endmodule


