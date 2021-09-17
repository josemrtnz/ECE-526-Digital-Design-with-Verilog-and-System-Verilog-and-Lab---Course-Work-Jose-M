/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #10            Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 10 - Serial Protocol                                         ***
***                                                                         ***
*******************************************************************************
*** Filename: serial_protocol.v  Created by Jose Luis Martinez, May 2, 2021 ***
***                                                                         ***
******************************************************************************/

`include "definitions.v"

module serial_protocol(sys_clk, D_in, send, i_clk, i_data, i_strobe, 
					   i_rst, o_clk, o_data, o_strobe, D_out, valid);

	input sys_clk, send, i_clk, i_data, i_strobe, i_rst;
	input [7:0] D_in;
	output o_strobe, valid;
	output o_clk, o_data;
	output [7:0] D_out;

	serial_to_parallel stb1( .sys_clk(sys_clk), .i_clk(i_clk), .i_strobe(i_strobe), .i_rst(i_rst), 
		                .i_data(i_data), .D_out(D_out), .valid(valid));
	parallel_to_serial bts1(.sys_clk(sys_clk), .i_rst(i_rst), .D_in(D_in), .send(send), 
		               .o_clk(o_clk), .o_data(o_data), .o_strobe(o_strobe));
endmodule