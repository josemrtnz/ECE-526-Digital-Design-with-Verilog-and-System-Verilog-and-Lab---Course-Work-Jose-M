/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #6B            Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 6B - Sum of Products                                         ***
***                                                                         ***
*******************************************************************************
*** Filename: lab_6b_ex_tb.v   Created by Jose Luis Martinez, April 1, 2021 ***
***                                                                         ***
******************************************************************************/

`timescale 1ns/100ps

`define CLK_PER 20
`define SDISPLAY "%d, D_IN = %d, C0 = %d, C1 = %d, C2 = %d, C3 = %d, RST = %b, CLK = %b| OUT = %d Expected OUT = %d"

module lab_6b_ex_tb();
	parameter SIZE = 4;

	reg [SIZE-1:0] D_IN;
	reg [SIZE-1:0] C0;
	reg [SIZE-1:0] C1;
	reg [SIZE-1:0] C2;
	reg [SIZE-1:0] C3;
	reg [(SIZE*2)+1:0] E_OUT;
	reg [3:0] D_ARR [SIZE-1:0];
	reg RST, CLK;
	wire [(SIZE*2)+1:0] OUT;
	integer i;

	top_lvl #(.SIZE(SIZE)) tp1(.OUT(OUT), .D_IN(D_IN), .C0(C0), .C1(C1), .C2(C2), .C3(C3), .RST(RST), .CLK(CLK));

	initial begin
		CLK <= 0;
		forever begin
			#(`CLK_PER/2) CLK <= ~CLK;
		end
	end

	initial $monitorb(`SDISPLAY, $time, D_IN, C0, C1, C2, C3, RST, CLK, OUT, E_OUT);

	initial begin
		$vcdpluson;
		RST <= 1'b1;
		D_IN <= 4'h0;
		D_ARR[0] <= 4'h0;
		C0 <= 4'h2;
		C1 <= 4'h3;
		C2 <= 4'h4;
		C3 <= 4'h9;

		#(`CLK_PER*6)
		$display("\t\t\tFirst set of test vectors.\n\n");
		$monitoroff;
		#(`CLK_PER*4)
		$monitoron;
		#(`CLK_PER*6)
		$display("\t\t\tLast set of test vectors.\n\n");
		$finish;
	end

	always@(posedge CLK) begin
		D_IN <= D_IN + 1'b1;

		E_OUT <= C0*D_ARR[0] + C1*D_ARR[1] + C2*D_ARR[2] + C3*D_ARR[3];

		#(1)
		D_ARR[3] <= D_ARR[2];
		D_ARR[2] <= D_ARR[1];
		D_ARR[1] <= D_ARR[0];
		D_ARR[0] <= D_IN;

		if(E_OUT != OUT) begin
			$display("\t\t\tError! Outputs do not match!\n");
			$finish;
		end 
	end

	`ifdef ERROR
	initial begin
		#(`CLK_PER*9)
		$monitoron;
		#(`CLK_PER*6) force OUT = 4'b1x0x;	
	end
	`endif

endmodule




































































