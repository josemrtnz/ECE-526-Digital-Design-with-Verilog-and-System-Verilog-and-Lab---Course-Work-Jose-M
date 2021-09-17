/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #4             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 4 - 8-Bit Register                                           ***
***                                                                         ***
*******************************************************************************
*** Filename: register.v    Created by Jose Luis Martinez, Febuary 22, 2021 ***
***                                                                         ***
******************************************************************************/

module register ( CLK, RST, ENA, DATA, R);
	input CLK, RST, ENA;
	input [7:0]DATA;
	output [7:0]R;

	wire [7:0] muxO, R_BAR;

	mux2_1 mux0(.OUT(muxO[0]), .A(R[0]), .B(DATA[0]), .SEL(ENA)); 
	mux2_1 mux1(.OUT(muxO[1]), .A(R[1]), .B(DATA[1]), .SEL(ENA)); 
	mux2_1 mux2(.OUT(muxO[2]), .A(R[2]), .B(DATA[2]), .SEL(ENA)); 
	mux2_1 mux3(.OUT(muxO[3]), .A(R[3]), .B(DATA[3]), .SEL(ENA)); 
	mux2_1 mux4(.OUT(muxO[4]), .A(R[4]), .B(DATA[4]), .SEL(ENA)); 
	mux2_1 mux5(.OUT(muxO[5]), .A(R[5]), .B(DATA[5]), .SEL(ENA)); 
	mux2_1 mux6(.OUT(muxO[6]), .A(R[6]), .B(DATA[6]), .SEL(ENA)); 
    mux2_1 mux7(.OUT(muxO[7]), .A(R[7]), .B(DATA[7]), .SEL(ENA)); 
	
	D_FF dff0(.q(R[0]), .q_bar(R_BAR[0]), .clock(CLK), .data(muxO[0]), .clear(RST));
	D_FF dff1(.q(R[1]), .q_bar(R_BAR[1]), .clock(CLK), .data(muxO[1]), .clear(RST));
	D_FF dff2(.q(R[2]), .q_bar(R_BAR[2]), .clock(CLK), .data(muxO[2]), .clear(RST));
	D_FF dff3(.q(R[3]), .q_bar(R_BAR[3]), .clock(CLK), .data(muxO[3]), .clear(RST));
	D_FF dff4(.q(R[4]), .q_bar(R_BAR[4]), .clock(CLK), .data(muxO[4]), .clear(RST));
	D_FF dff5(.q(R[5]), .q_bar(R_BAR[5]), .clock(CLK), .data(muxO[5]), .clear(RST));
	D_FF dff6(.q(R[6]), .q_bar(R_BAR[6]), .clock(CLK), .data(muxO[6]), .clear(RST));
	D_FF dff7(.q(R[7]), .q_bar(R_BAR[7]), .clock(CLK), .data(muxO[7]), .clear(RST));

endmodule