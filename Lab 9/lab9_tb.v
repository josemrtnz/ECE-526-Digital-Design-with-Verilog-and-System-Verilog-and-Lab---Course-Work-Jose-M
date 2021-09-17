/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #9             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 9 - Parameterized Synchronous FIFO                           ***
***                                                                         ***
*******************************************************************************
*** Filename: lab9_tb.v       Created by Jose Luis Martinez, April 28, 2021 ***
***                                                                         ***
******************************************************************************/

module lab9_tb();
	reg clk, wr_en, rd_en, rst;
	reg [`WIDTH_TB-1:0] data_in;
	wire [`WIDTH_TB-1:0]data_out;
	wire empty, a_e, full, a_f, valid, of, uf;
	wire [$clog2(`DEPTH_TB):0] count;

	integer i;

	sync_fifo sf1(.data_in(data_in), .clk(clk), .wr_en(wr_en), .rst(rst), 
		          .rd_en(rd_en), .data_out(data_out), .empty(empty), .a_e(a_e), 
		          .full(full), .a_f(a_f), .valid(valid), .of(of), .uf(uf), 
		          .count(count));

	initial begin
		clk <= 0;
		forever begin
			#(`CLK_PER/2) clk <= ~clk;
		end
	end

	initial begin
		$vcdpluson;
		wr_en <= 1;
		rd_en <= 0;
		rst <= 1;
		`ifdef FWFT
		data_in <= 5; 
		$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				             empty, a_e, full, a_f, valid, of, uf, count);

		for (i=0; i<`DEPTH_TB; i = i+1) begin
			#(`CLK_PER)
			data_in <= i;
			$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				             empty, a_e, full, a_f, valid, of, uf, count);
		end

		wr_en <= 0;
		rd_en <= 1;

		for (i=0; i<`DEPTH_TB; i = i+1) begin
			#(`CLK_PER)
			$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				             empty, a_e, full, a_f, valid, of, uf, count);
		end

		#(`CLK_PER)
		$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				             empty, a_e, full, a_f, valid, of, uf, count);

		`else
		data_in <= 0;
		$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				             empty, a_e, full, a_f, valid, of, uf, count);

		for (i=0; i<`DEPTH_TB; i = i+1) begin
			#(`CLK_PER)
			data_in <= i;
			$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				             empty, a_e, full, a_f, valid, of, uf, count);
		end

		wr_en <= 0;
		rd_en <= 1;

		for (i=0; i<`DEPTH_TB; i = i+1) begin
			#(`CLK_PER)
			$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				             empty, a_e, full, a_f, valid, of, uf, count);
		end

		#(`CLK_PER)
		$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				             empty, a_e, full, a_f, valid, of, uf, count);

		for (i=0; i<`DEPTH_TB; i = i+1) begin
			#(`CLK_PER)
			$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				             empty, a_e, full, a_f, valid, of, uf, count);
		end

		wr_en <= 1;
		rd_en <= 0;

		#(`CLK_PER)
		$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				         empty, a_e, full, a_f, valid, of, uf, count);
		rd_en <= 1;

		for (i=0; i<`DEPTH_TB; i = i+1) begin
			#(`CLK_PER)
			data_in <= i;
			$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				             empty, a_e, full, a_f, valid, of, uf, count);
		end

		#(`CLK_PER)
		rd_en <= 0;

		for (i=0; i<`DEPTH_TB; i = i+1) begin
			#(`CLK_PER)
			data_in <= i;
			$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				             empty, a_e, full, a_f, valid, of, uf, count);
		end
		
		#(`CLK_PER)
		$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				             empty, a_e, full, a_f, valid, of, uf, count);

		#(`CLK_PER)
		$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				             empty, a_e, full, a_f, valid, of, uf, count);

		#(`CLK_PER)
		$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				             empty, a_e, full, a_f, valid, of, uf, count);

		#(`CLK_PER)
		$strobe(`STRING, $time, data_in, clk, wr_en, rd_en, rst, data_out, 
				             empty, a_e, full, a_f, valid, of, uf, count);
		`endif
		$finish;
	end

endmodule