/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #6B            Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 6B - Sum of Products                                         ***
***                                                                         ***
*******************************************************************************
*** Filename: lab_6b_nonex_tb.vCreated by Jose Luis Martinez, April 1, 2021 ***
***                                                                         ***
******************************************************************************/

`timescale 1ns/100ps

`define CLK_PER 20
`define SDISPLAY "%d, D_IN = %h, C0 = %h, C1 = %h, C2 = %h, C3 = %h, RST = %b, CLK = %b| OUT = %d"

module lab_6b_nonex_tb();
	parameter SIZE = 4;

	reg [SIZE-1:0] D_IN;
	reg [SIZE-1:0] C0;
	reg [SIZE-1:0] C1;
	reg [SIZE-1:0] C2;
	reg [SIZE-1:0] C3;
	reg RST, CLK;
	wire [(SIZE*2)+1:0] OUT;

	top_lvl #(.SIZE(SIZE)) tp1(.OUT(OUT), .D_IN(D_IN), .C0(C0), .C1(C1), .C2(C2), .C3(C3), .RST(RST), .CLK(CLK));

	initial begin
		CLK <= 0;
		forever begin
			#(`CLK_PER/2) CLK <= ~CLK;
		end
	end

	initial begin
		$vcdpluson;
		D_IN <= 4'h4;
		RST <= 1'b1;
		C0 <= 4'h2;
		C1 <= 4'h3;
		C2 <= 4'h4;
		C3 <= 4'h9;
		$display(`SDISPLAY, $time, D_IN, C0, C1, C2, C3, RST, CLK, OUT);

		#(`CLK_PER)
		D_IN <= 4'h0;
		$display(`SDISPLAY, $time, D_IN, C0, C1, C2, C3, RST, CLK, OUT);

		#(`CLK_PER)
		D_IN <= 4'h1;
		$display(`SDISPLAY, $time, D_IN, C0, C1, C2, C3, RST, CLK, OUT);

		#(`CLK_PER)
		D_IN <= 4'hA;
		$display(`SDISPLAY, $time, D_IN, C0, C1, C2, C3, RST, CLK, OUT);

		#(`CLK_PER)
		D_IN <= 4'hB;
		$display(`SDISPLAY, $time, D_IN, C0, C1, C2, C3, RST, CLK, OUT);

		#(`CLK_PER)
		D_IN <= 4'h2;
		$display(`SDISPLAY, $time, D_IN, C0, C1, C2, C3, RST, CLK, OUT);

		#(`CLK_PER)
		D_IN <= 4'hF;
		$display(`SDISPLAY, $time, D_IN, C0, C1, C2, C3, RST, CLK, OUT);
		
		#(`CLK_PER)
		D_IN <= 4'h8;
		$display(`SDISPLAY, $time, D_IN, C0, C1, C2, C3, RST, CLK, OUT);
		
		#(`CLK_PER)
		D_IN <= 4'h0;
		$display(`SDISPLAY, $time, D_IN, C0, C1, C2, C3, RST, CLK, OUT);
		
		#(`CLK_PER)
		D_IN <= 4'hD;
		$display(`SDISPLAY, $time, D_IN, C0, C1, C2, C3, RST, CLK, OUT);
		
		#(`CLK_PER) 
		$display(`SDISPLAY, $time, D_IN, C0, C1, C2, C3, RST, CLK, OUT);
		$finish;
	end

endmodule




































































