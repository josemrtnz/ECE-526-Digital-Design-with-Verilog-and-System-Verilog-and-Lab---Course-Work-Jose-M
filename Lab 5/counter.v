/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #5             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 5 - 8-Bit Counter                                            ***
***                                                                         ***
*******************************************************************************
*** Filename: counter.v     Created by Jose Luis Martinez, Febuary 25, 2021 ***
***                                                                         ***
******************************************************************************/

`include "definitions.v"

module counter(clk, reset, enable, load, data, count);
	input clk, reset, enable, load;
	input [7:0]data;
	output reg[7:0]count;

	initial begin
		count <= 8'b0;
	end

	always@(posedge clk or negedge reset) begin

		if(!reset) begin count <= 8'b0; end
		else if(enable) begin
			 	if(load) begin count <= data; end
				else begin count <= count + 1; end
			end
	end
	
endmodule