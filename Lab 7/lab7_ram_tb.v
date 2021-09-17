/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #7             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 7 - Register File Models                                     ***
***                                                                         ***
*******************************************************************************
*** Filename: lab7_ram_tb.v    Created by Jose Luis Martinez, April 7, 2021 ***
***                                                                         ***
******************************************************************************/

`timescale 1ns/100ps

`define WIDTH_TB 8
`define DEPTH_TB 5
`define CLK_PER 20
`define STRING "RAM || %d, ADDR = %h, OE = %b, WS = %b, CS = %b | DATA = %h"
`define STRINGB "RAM || %d, ADDR = %h, OE = %b, WS = %b, CS = %b | DATA = %b"

module lab7_ram_tb();
	reg OE, WS, CS;
	reg [`DEPTH_TB-1:0]ADDR;
	wire [`WIDTH_TB-1:0]DATA;
	reg [`WIDTH_TB-1:0]DATA_TB;

	reg [`WIDTH_TB-1:0]LOOP;

	reg_file_ram ram1(.ADDR(ADDR), .OE(OE), .WS(WS), .CS(CS), .DATA(DATA));

	assign DATA = (!OE & !CS) ? DATA_TB : 8'bz;

	initial begin
		$vcdpluson;
		OE <= 0;
		WS <= 0;
		CS <= 0;
		ADDR <= 0;
		#(`CLK_PER)
		$display("Ram test start.",);
		$display("\t\tWriting to RAM.");

		for (LOOP = 0; LOOP < 32; LOOP = LOOP+1) begin
			#(`CLK_PER)
			ADDR <= LOOP;
			DATA_TB <= LOOP;
			#(`CLK_PER)
			WS <= 1;
			$strobe(`STRING, $time, ADDR, OE, WS, CS, DATA);
			#(`CLK_PER)
			WS<= 0;
			$strobe(`STRING, $time, ADDR, OE, WS, CS, DATA);
		end

		#(`CLK_PER)
		$display("\t\tFinished writing to RAM.\n\n");
		$display("\t\tReading from RAM.");

		OE <= 1;

		for (LOOP = 0; LOOP < 32; LOOP = LOOP+1) begin
			#(`CLK_PER)
			ADDR <= LOOP;
			#(`CLK_PER)
			$strobe(`STRING, $time, ADDR, OE, WS, CS, DATA);
		end
		#(`CLK_PER)
		$display("\t\tFinished reading from RAM.\n\n");
		$display("\t\tWriting walking ones pattern to RAM.");

		DATA_TB <= `WIDTH_TB'b1;
		OE <= 0;

		for (LOOP = 0; LOOP < 32; LOOP = LOOP+1) begin
			#(`CLK_PER)

			if (!LOOP) begin
				ADDR <= LOOP;
				DATA_TB <= `WIDTH_TB'b1;
			end else begin
				ADDR <= LOOP;
				DATA_TB <= {DATA_TB[`WIDTH_TB-2:0], DATA_TB[`WIDTH_TB-1]};
			end
			#(`CLK_PER)
			WS <= 1;
			$strobe(`STRINGB, $time, ADDR, OE, WS, CS, DATA);
			#(`CLK_PER)
			WS<= 0;
			$strobe(`STRINGB, $time, ADDR, OE, WS, CS, DATA);
		end

		#(`CLK_PER)
		$display("\t\tFinished writing walking ones to RAM.\n\n");
		$display("\t\tReading walking ones from RAM.");

		OE <= 1;

		for (LOOP = 0; LOOP < 32; LOOP = LOOP+1) begin
			#(`CLK_PER)
			ADDR <= LOOP;
			#(`CLK_PER)
			$strobe(`STRINGB, $time, ADDR, OE, WS, CS, DATA);
		end
		#(`CLK_PER)
		$display("\t\tFinished reading walking ones from RAM.\n\n");

		$display("\t\tShowing disabled state.");
		CS <= 1;
		#(`CLK_PER)
		WS <= 1;
		$strobe(`STRINGB, $time, ADDR, OE, WS, CS, DATA);
		#(`CLK_PER)
		WS <= 0;
		$strobe(`STRINGB, $time, ADDR, OE, WS, CS, DATA);
		#(`CLK_PER)
		OE <= 0;
		ADDR <= 0;
		$strobe(`STRINGB, $time, ADDR, OE, WS, CS, DATA);
		#(`CLK_PER)
		$strobe(`STRINGB, $time, ADDR, OE, WS, CS, DATA);
		#(`CLK_PER)
		$display("\t\tRAM test finished.\n\n");
	end

endmodule;