/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #10            Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 10 - Serial Protocol                                         ***
***                                                                         ***
*******************************************************************************
*** Filename: lab10_tb.v         Created by Jose Luis Martinez, May 2, 2021 ***
***                                                                         ***
******************************************************************************/

module lab10_tb();
	reg sys_clk, send, i_rst;
	reg [7:0] D_in;

	wire o_strobe, valid;
	wire o_clk, o_data;
	wire [7:0] D_out;

	serial_protocol sp1(.sys_clk(sys_clk), .D_in(D_in), .send(send), .i_clk(o_clk), .i_data(o_data), 
		                .i_strobe(o_strobe), .i_rst(i_rst), .o_clk(o_clk), .o_data(o_data), .o_strobe(o_strobe), 
		                .D_out(D_out), .valid(valid));

	initial begin
		sys_clk <= 0;
		forever begin
			#(`CLK_PER/2) sys_clk <= ~sys_clk;
		end
	end

	initial begin
		$vcdpluson;
		send <= 0;
		i_rst <= 1;
		D_in <= 8'hfa;
		#(`CLK_PER)
		send <= 1'b1;
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		send <= 1'b0;
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
	
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)

		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
	
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)

		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
	
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
	
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)

		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
	
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		D_in <= 8'hd4;
		#(`CLK_PER)
		send <= 1'b1;
	
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		send <= 1'b0;
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
			#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)

		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)

		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)

		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)

		$strobe(`STRING, $time, sys_clk, send, i_rst,
			             D_in, o_strobe, valid, o_clk, o_data, D_out);
		#(`CLK_PER)
		$finish;
	end

endmodule

