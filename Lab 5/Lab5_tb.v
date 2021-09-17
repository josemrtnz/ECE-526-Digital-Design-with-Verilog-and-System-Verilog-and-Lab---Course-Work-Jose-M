/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #5             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 5 - 8-Bit Counter                                            ***
***                                                                         ***
*******************************************************************************
*** Filename: Lab5_tb.v     Created by Jose Luis Martinez, Febuary 25, 2021 ***
***                                                                         ***
******************************************************************************/

`include "definitions.v"

module Lab5_tb();
	reg clk, reset, enable, load;
	reg [7:0]data;
	wire [7:0]counter;
	AASD_counter c1(.clk(clk), .reset(reset), .enable(enable), .load(load), .data(data), .count(counter));

	initial begin
		clk <= 0;
		forever begin
			#(`CLK_PER/2) clk <= ~clk;
		end
	end

	initial begin
		$vcdpluson;
		reset = 1'b1;
		enable = 1'b1;
		load = 1'b0;
		data = 8'hfa;
		$display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#5 reset = 1'b0;
		#(`CLK_PER-5) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		reset = 1'b1;
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		load = 1'b1;
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		load = 1'b0;
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		enable = 1'b0;
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#5 reset = 1'b0;
		#5 load = 1'b1;
		#(`CLK_PER-10) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		enable = 1'b1;
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		reset = 1'b1;
		load = 1'b0;
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		#(`CLK_PER) $display(`DISPLAY_STRING, $time, clk, reset, enable, load, data, counter);
		 
		#(`CLK_PER) $finish;
	end 

endmodule