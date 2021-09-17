/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #5             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 5 - 8-Bit Counter                                            ***
***                                                                         ***
*******************************************************************************
*** Filename: AASD_reset.v  Created by Jose Luis Martinez, Febuary 25, 2021 ***
***                                                                         ***
******************************************************************************/

`include "definitions.v"

module AASD_reset(out, clk, reset);
	input clk, reset;
	output reg out;

	reg d;

	always@(posedge clk or negedge reset) begin
		if(!reset) begin
			out <= 1'b0;
			d <= 1'b0;
		end else begin
			d <= reset;
			out <= d;
		end
	end
endmodule