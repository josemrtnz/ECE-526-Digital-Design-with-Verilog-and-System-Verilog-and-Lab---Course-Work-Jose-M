/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #7             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 7 - Register File Models                                     ***
***                                                                         ***
*******************************************************************************
*** Filename: reg_file_rom.v    Created by Jose Luis Martinez, April 7, 2021***
***                                                                         ***
******************************************************************************/

`timescale 1ns/100ps

module reg_file_rom(ADDR, OE, CS, DATA);
	parameter WIDTH = 8;
	parameter DEPTH = 5;

	input OE, CS;
	input [DEPTH-1:0]ADDR;
	output [WIDTH-1:0]DATA;

	reg [WIDTH-1:0]ROM[0:(2**DEPTH)-1];

	initial begin
		$display("Loading ROM contents.");
		$readmemh("rom_contents.mem", ROM, 0, (2**DEPTH)-1);
	end

	assign DATA = OE ? ROM[ADDR] : {WIDTH{1'bz}};

endmodule
