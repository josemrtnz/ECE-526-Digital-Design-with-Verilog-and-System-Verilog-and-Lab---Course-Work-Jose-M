/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #7             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 7 - Register File Models                                     ***
***                                                                         ***
*******************************************************************************
*** Filename: lab7_rom_tb.v    Created by Jose Luis Martinez, April 7, 2021 ***
***                                                                         ***
******************************************************************************/

`timescale 1ns/100ps

`define WIDTH_TB 8
`define DEPTH_TB 5
`define CLK_PER 20
`define STRINGR "ROM || %d, ADDR = %h, OE = %b, CS = %b | DATA = %h"

module lab7_rom_tb();
	reg OE, CS;
	reg [`DEPTH_TB-1:0]ADDR;
	wire [`WIDTH_TB-1:0]DATA;

	reg OE_RAM, WS_RAM, CS_RAM;
	reg [`DEPTH_TB-1:0]ADDR_RAM;
	wire [`WIDTH_TB-1:0]DATA_RAM;
	reg [`WIDTH_TB-1:0]DATA_TB;

	reg [`WIDTH_TB-1:0]LOOP;

	reg_file_rom rom1(.ADDR(ADDR), .OE(OE), .CS(CS), .DATA(DATA));
	reg_file_ram ram2(.ADDR(ADDR_RAM), .OE(OE_RAM), .WS(WS_RAM), .CS(CS_RAM), .DATA(DATA_RAM));

	assign DATA_RAM = (!OE_RAM & !CS_RAM) ? DATA_TB : 8'bz;

	initial begin
		OE_RAM <= 0;
		WS_RAM <= 0;
		CS_RAM <= 1;
		ADDR_RAM <= 0;
		#(7000)
		$vcdpluson;

		$display("ROM test start.");
		OE <= 1;
		CS <= 0;
		CS_RAM <= 0;
		$display("\t\tReading from ROM.");

		for (LOOP = 0; LOOP < 32; LOOP = LOOP+1) begin
			#(`CLK_PER)
			ADDR <= LOOP;
			#(`CLK_PER)
			$strobe(`STRINGR, $time, ADDR, OE, CS, DATA);
		end
		#(`CLK_PER)
		$display("\t\tFinished reading from ROM.\n\n");

		$display("\t\tScrambling ROM contents into RAM.");
		for (LOOP = 0; LOOP < 32; LOOP = LOOP+1) begin
			#(`CLK_PER)
			ADDR <= LOOP;
			#(`CLK_PER)
			DATA_TB[7] <= DATA[0];
			DATA_TB[6] <= DATA[7];
			DATA_TB[5] <= DATA[1];
			DATA_TB[4] <= DATA[6];
			DATA_TB[3] <= DATA[2];
			DATA_TB[2] <= DATA[5];
			DATA_TB[1] <= DATA[3];
			DATA_TB[0] <= DATA[4];
			ADDR_RAM <= LOOP;
			#(`CLK_PER)
			WS_RAM <= 1;
			$strobe(`STRING, $time, ADDR_RAM, OE_RAM, WS_RAM, CS_RAM, DATA_RAM);
			#(`CLK_PER)
			WS_RAM <= 0;
			$strobe(`STRING, $time, ADDR_RAM, OE_RAM, WS_RAM, CS_RAM, DATA_RAM);
		end

		#(`CLK_PER)
		$display("\t\tFinished scrambling contents from ROM to RAM.\n\n");

		$display("\t\tReading scrambled contents from RAM.");

		OE_RAM <= 1;

		for (LOOP = 0; LOOP < 32; LOOP = LOOP+1) begin
			#(`CLK_PER)
			ADDR_RAM <= LOOP;
			#(`CLK_PER)
			$strobe(`STRING, $time, ADDR_RAM, OE_RAM, WS_RAM, CS_RAM, DATA_RAM);
		end
		#(`CLK_PER)
		$display("\t\tFinished reading scrambled contents from RAM.\n\n");
		$display("End of ROM test.\n\n");
		$finish;
	end

endmodule