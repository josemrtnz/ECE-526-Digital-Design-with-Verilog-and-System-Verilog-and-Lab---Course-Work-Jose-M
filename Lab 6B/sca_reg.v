/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #6B            Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 6B - Sum of Products                                         ***
***                                                                         ***
*******************************************************************************
*** Filename: sca_reg.v        Created by Jose Luis Martinez, April 1, 2021 ***
***                                                                         ***
******************************************************************************/

`timescale 1ns/100ps

module sca_reg(OUT, A, RST, CLK);
	parameter SIZE = 4;
	input CLK, RST;
	input [SIZE-1:0] A;
	output reg [SIZE-1:0] OUT;

	always@(posedge CLK or negedge RST) begin
		if(!RST) begin 
			OUT <= 0;
		end else begin 
			OUT <= A; 
		end
	end
endmodule