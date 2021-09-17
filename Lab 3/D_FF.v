/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #3             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 3 - DFF                                                      ***
***                                                                         ***
*******************************************************************************
*** Filename: D_FF.v        Created by Jose Luis Martinez, Febuary 11, 2021 ***
***                                                                         ***
******************************************************************************/

`include "definitions.v"

module D_FF(q, q_bar, clock, data, clear);
	output q, q_bar;
	input clock, data, clear;
	wire cbar, clkbar, dbar, clr, clk, d, sbar,s, r, rbar;

	not #(`TIME_DELAY_1 + `FAN_OUT_1) NOT1(cbar, clear);
	not #(`TIME_DELAY_1 + `FAN_OUT_3) NOT2(clr, cbar);
	not #(`TIME_DELAY_1 + `FAN_OUT_1) NOT3(clkbar, clock);
	not #(`TIME_DELAY_1 + `FAN_OUT_2) NOT4(clk, clkbar);
	not #(`TIME_DELAY_1 + `FAN_OUT_1) NOT5(dbar, data);
	not #(`TIME_DELAY_1 + `FAN_OUT_1) NOT6(d, dbar);

	SR_latch2 srl1( .Q(sbar), .Q_bar(s), .s0(rbar), .s1(1'b1), .r0(clr), .r1(clk));
	defparam srl1.DELAY_1 = `TIME_DELAY_3 + `FAN_OUT_1; 
    defparam srl1.DELAY_2 = `TIME_DELAY_3 + `FAN_OUT_3; 

	SR_latch2 srl2(.Q(r), .Q_bar(rbar), .s0(clk), .s1(s), .r0(clr), .r1(d));
	defparam srl2.DELAY_1 = `TIME_DELAY_3 + `FAN_OUT_2;
    defparam srl2.DELAY_2 = `TIME_DELAY_3 + `FAN_OUT_2;

	SR_latch2 srl3(.Q(q), .Q_bar(q_bar), .s0(s), .s1(1'b1), .r0(clr), .r1(r));
	defparam srl3.DELAY_1 = `TIME_DELAY_3 + `FAN_OUT_1 + `PRIMARY_OUT; 
    defparam srl3.DELAY_2 = `TIME_DELAY_3 + `FAN_OUT_1 + `PRIMARY_OUT; 
	
endmodule

