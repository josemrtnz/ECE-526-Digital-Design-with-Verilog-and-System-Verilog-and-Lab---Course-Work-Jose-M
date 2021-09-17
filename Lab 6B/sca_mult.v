/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #6B            Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 6B - Sum of Products                                         ***
***                                                                         ***
*******************************************************************************
*** Filename: sca_mult.v       Created by Jose Luis Martinez, April 1, 2021 ***
***                                                                         ***
******************************************************************************/

`timescale 1ns/100ps

module sca_mult(OUT, A, B);
	parameter SIZE = 4;
	input [SIZE-1:0] A;
	input [SIZE-1:0] B;
	output [(SIZE*2)-1:0] OUT;

	assign OUT = A * B;
endmodule