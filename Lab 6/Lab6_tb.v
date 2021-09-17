/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #6             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 6 - Scalable Mux                                             ***
***                                                                         ***
*******************************************************************************
*** Filename: Lab6_tb.v       Created by Jose Luis Martinez, March 24, 2021 ***
***                                                                         ***
******************************************************************************/
`timescale 1ns/100ps

`define DISPLAY_STRING "%d, A = %b, B = %b, SEL = %b, | OUT1 = %b, OUT4 = %b, OUT5 = %b, OUT6 = %b"

module Lab6_tb();
	reg [5:0]A;
	reg [5:0]B;
	reg SEL;
	wire OUT1;
	wire [3:0]OUT4;
	wire [4:0]OUT5;
	wire [5:0]OUT6;

	sca_mux m1(.A(A), .B(B), .SEL(SEL), .OUT(OUT1));
	sca_mux #(4) m4(.A(A), .B(B), .SEL(SEL), .OUT(OUT4));
	sca_mux #(.SIZE(5)) m5(.A(A), .B(B), .SEL(SEL), .OUT(OUT5));
	sca_mux m6(.A(A), .B(B), .SEL(SEL), .OUT(OUT6));
		defparam m6.SIZE = 6;

	initial
	begin
		$vcdpluson;
		A <= 6'b10_0100;
		B <= 6'b11_0011;
		SEL <= 1'b0;
		#(20) $display(`DISPLAY_STRING, $time, A, B, SEL, OUT1, OUT4, OUT5, OUT6);
		A <= 6'b10_1100;
		B <= 6'b11_0111;
		SEL <= 1'b0;
		#(20) $display(`DISPLAY_STRING, $time, A, B, SEL, OUT1, OUT4, OUT5, OUT6);
		A <= 6'b10_0100;
		B <= 6'b11_0011;
		SEL <= 1'b1;
		#(20) $display(`DISPLAY_STRING, $time, A, B, SEL, OUT1, OUT4, OUT5, OUT6);
		A <= 6'b10_1100;
		B <= 6'b11_0111;
		SEL <= 1'b1;
		#(20) $display(`DISPLAY_STRING, $time, A, B, SEL, OUT1, OUT4, OUT5, OUT6);

		A <= 6'b01_0111;
		B <= 6'b10_1001;
		SEL <= 1'b0;
		#(20) $display(`DISPLAY_STRING, $time, A, B, SEL, OUT1, OUT4, OUT5, OUT6);
		A <= 6'b01_1001;
		B <= 6'b01_1001;
		SEL <= 1'b0;
		#(20) $display(`DISPLAY_STRING, $time, A, B, SEL, OUT1, OUT4, OUT5, OUT6);
		A <= 6'b01_0111;
		B <= 6'b10_1001;
		SEL <= 1'b1;
		#(20) $display(`DISPLAY_STRING, $time, A, B, SEL, OUT1, OUT4, OUT5, OUT6);
		A <= 6'b01_1001;
		B <= 6'b01_1001;
		SEL <= 1'b1;
		#(20) $display(`DISPLAY_STRING, $time, A, B, SEL, OUT1, OUT4, OUT5, OUT6);
		
		A <= 6'b01_1001;
		B <= 6'b01_1001;
		SEL <= 1'bx;
		#(20) $display(`DISPLAY_STRING, $time, A, B, SEL, OUT1, OUT4, OUT5, OUT6);
		A <= 6'b01_1001;
		B <= 6'b10_0110;
		SEL <= 1'bx;
		#(20) $display(`DISPLAY_STRING, $time, A, B, SEL, OUT1, OUT4, OUT5, OUT6);
		A <= 6'b01_1001;
		B <= 6'b11_1000;
		SEL <= 1'bx;
		#(20) $display(`DISPLAY_STRING, $time, A, B, SEL, OUT1, OUT4, OUT5, OUT6);
		$finish;
	end

endmodule