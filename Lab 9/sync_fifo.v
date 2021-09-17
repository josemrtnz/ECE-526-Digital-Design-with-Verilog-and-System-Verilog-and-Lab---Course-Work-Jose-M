/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #9             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 9 - Parameterized Synchronous FIFO                           ***
***                                                                         ***
*******************************************************************************
*** Filename: sync_fifo.v     Created by Jose Luis Martinez, April 28, 2021 ***
***                                                                         ***
******************************************************************************/

module sync_fifo(data_in, clk, wr_en, rd_en, rst, data_out, 
	             empty, a_e, full, a_f, valid, of, uf, count);
	parameter WIDTH = 8;
	parameter DEPTH = 32;
	parameter ALMOST = 2;
	input clk, wr_en, rd_en, rst;
	input [WIDTH-1: 0]data_in;
	output reg empty, a_e, full, a_f;
	output reg of, uf, valid; 
	output reg [$clog2(DEPTH):0] count;
	output reg [WIDTH-1:0]data_out;

	integer i;

	reg [WIDTH-1:0] fifo_data [0:DEPTH-1];
	integer writecount, readcount;
	reg [$clog2(DEPTH):0] wr_ptr, rd_ptr;

	initial begin
		data_out <= {WIDTH-1{1'b0}};
		of <= 0;
		uf <= 0;
		writecount <= {$clog2(DEPTH){1'b0}};
		readcount <= {$clog2(DEPTH){1'b0}};
	end

	always@(posedge clk, negedge rst) begin
		valid <= 0;
		of <= 0;
		uf <= 0;
		if(!rst) begin
			writecount <= 0;
			readcount <= 0;
		end else begin

			if(wr_en) begin
				if(full) begin of <= 1; end
				else begin
					`ifdef FWFT
					if(empty) begin 
						data_out <= data_in; 
					end
					`endif
					fifo_data[wr_ptr] <= data_in;
					writecount <= writecount + 1; 
				end
			end

			if(rd_en) begin
				if(empty) begin uf <= 1; end
				else begin
					valid <= 1;
					data_out <= fifo_data[rd_ptr];
					readcount <= readcount + 1;
				end
			end
		end
	end

	always@(readcount, writecount) begin
		wr_ptr <= writecount%DEPTH;
		rd_ptr <= readcount%DEPTH;

		full <= (writecount - readcount) == DEPTH;
		empty <= (writecount - readcount) == 0;
		a_f <= (writecount - readcount) > DEPTH - ALMOST - 1;
		a_e <= (writecount - readcount) < ALMOST + 1;
		count <= writecount - readcount;
	end

endmodule