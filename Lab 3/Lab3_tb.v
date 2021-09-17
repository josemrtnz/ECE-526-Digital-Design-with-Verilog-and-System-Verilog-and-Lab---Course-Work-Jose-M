/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #3             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 3 - DFF                                                      ***
***                                                                         ***
*******************************************************************************
*** Filename: LAB3_tb.v     Created by Jose Luis Martinez, Febuary 11, 2021 ***
***                                                                         ***
******************************************************************************/

`include "definitions.v"

module Lab3_tb();
	reg clock, data, clear;
	wire q, q_bar;
	D_FF dff(.q(q), .q_bar(q_bar), .clock(clock), .data(data), .clear(clear));

	initial begin
		$monitor(`MONITOR_STR_1, $time, clock, data, clear, q, q_bar);
	end

	initial begin
		$vcdpluson;
			clock = 1'b0;
			data = 1'b0;
			clear = 1'b1;
		#50 clock = 1'b1;
			data = 1'b0;
			clear = 1'b1;
		#50 clock = 1'b0;
			data = 1'b0;
			clear = 1'b1;
		#50 clock = 1'b1;
			data = 1'b0;
			clear = 1'b1;
		#50 clock = 1'b0;
			data = 1'b1;
			clear = 1'b1;	
	    $monitoroff;
	    #50 $display(`MONITOR_STR_1, $time, clock, data, clear, q, q_bar);
	        clock = 1'b1;
			data = 1'b1;
			clear = 1'b1;
		#50 $write(`MONITOR_STR_1_W, $time, clock, data, clear, q, q_bar);
		    clock = 1'b0;
			data = 1'b1;
			clear = 1'b1;

		#50 clock = 1'b1;
			data = 1'b1;
			clear = 1'b1;
			$strobe(`MONITOR_STR_1, $time, clock, data, clear, q, q_bar);
		#50 clock = 1'b0;
			data = 1'b0;
			clear = 1'b0;
			$strobe(`MONITOR_STR_1, $time, clock, data, clear, q, q_bar);
		#50 clock = 1'b1;
			data = 1'b0;
			clear = 1'b0;
			$strobe(`MONITOR_STR_1, $time, clock, data, clear, q, q_bar);
		#50 clock = 1'b0;
			data = 1'b0;
			clear = 1'b0;
			$strobe(`MONITOR_STR_1, $time, clock, data, clear, q, q_bar);
		#50 clock = 1'b1;
			data = 1'b0;
			clear = 1'b0;
			$strobe(`MONITOR_STR_1, $time, clock, data, clear, q, q_bar);
		#50 clock = 1'b0;
			data = 1'b1;
			clear = 1'b0;
			$strobe(`MONITOR_STR_1, $time, clock, data, clear, q, q_bar);
		#50 clock = 1'b1;
			data = 1'b1;
			clear = 1'b0;
			$strobe(`MONITOR_STR_1, $time, clock, data, clear, q, q_bar);
		#50 clock = 1'b0;
			data = 1'b1;
			clear = 1'b0;
			$strobe(`MONITOR_STR_1, $time, clock, data, clear, q, q_bar);
		#50 clock = 1'b1;
			data = 1'b1;
			clear = 1'b0;
			$strobe(`MONITOR_STR_1, $time, clock, data, clear, q, q_bar);
		#50 $finish;
	end


endmodule