/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #7             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 7 - Register File Models                                     ***
***                                                                         ***
*******************************************************************************
*** Filename: reg_file_ram.v   Created by Jose Luis Martinez, April 7, 2021 ***
***                                                                         ***
******************************************************************************/

`timescale 1ns/100ps

module reg_file_ram(ADDR, OE, WS, CS, DATA);
	parameter WIDTH = 8;
	parameter DEPTH = 5;

	input OE, WS, CS;
	input [DEPTH-1:0]ADDR;
	inout [WIDTH-1:0]DATA;

	reg [WIDTH-1:0]RAM[0:(2**DEPTH)-1];

	assign DATA = (OE & !CS) ? RAM[ADDR] : {WIDTH{1'bz}};

	always@(posedge WS) begin
		if (!OE & !CS) begin
			RAM[ADDR] <= DATA;
		end
	end

endmodule

