/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #5             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 5 - 8-Bit Counter                                            ***
***                                                                         ***
*******************************************************************************
*** Filename: AASD_counter.vCreated by Jose Luis Martinez, Febuary 25, 2021 ***
***                                                                         ***
******************************************************************************/

`include "definitions.v"

module AASD_counter(clk, reset, enable, load, data, count);
	input clk, reset, enable, load;
	input [7:0]data;
	output [7:0]count;

	wire arstO;

		AASD_reset arst(.out(arstO), .clk(clk), .reset(reset));
		counter c1(.clk(clk), .reset(arstO), .enable(enable), 
			       .load(load), .data(data), .count(count));

endmodule
