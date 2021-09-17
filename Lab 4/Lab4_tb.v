/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #4             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 4 - 8-Bit Register                                           ***
***                                                                         ***
*******************************************************************************
*** Filename: LAB4_tb.v     Created by Jose Luis Martinez, Febuary 22, 2021 ***
***                                                                         ***
******************************************************************************/

`include "definitions.v"

module Lab3_tb();
	reg clock, reset, enable;
	reg [7:0]data;
	wire [7:0]R1;
	register reg1(.CLK(clock), .RST(reset), .ENA(enable), .DATA(data), .R(R1));

	initial begin
		$monitor(`MONITOR_STR_1, $time, clock, reset, enable, data, R1);
	end

	initial begin
		clock = 0;
		forever begin
			#(`CLK_PER/2) clock = ~clock;
		end
	end

	initial begin
		 $vcdpluson;
		 data = 8'h00;
		 enable = 1;
		 reset = 0;

	#(`CLK_PER) data = 8'hf0;
		 enable = 1;
		 reset = 0;

	#(`CLK_PER) data = 8'hff;
		 enable = 1;
		 reset = 1;

	#(`CLK_PER) data = 8'h01;
		 enable = 1;
		 reset = 1;

	#(`CLK_PER) data = 8'heb;
		 enable = 1;
		 reset = 1;

	#(`CLK_PER) data = 8'hff;
		 enable = 0;
		 reset = 1;

	#(`CLK_PER) data = 8'h01;
		 enable = 0;
		 reset = 1;

	#(`CLK_PER) data = 8'hf0;
		 enable = 1;
		 reset = 0;

	#(`CLK_PER) data = 8'hff;
		 enable = 1;
		 reset = 0;

	#(`CLK_PER) data = 8'h01;
		 enable = 0;
		 reset = 0;
	
	#(`CLK_PER) $finish;
	end


endmodule