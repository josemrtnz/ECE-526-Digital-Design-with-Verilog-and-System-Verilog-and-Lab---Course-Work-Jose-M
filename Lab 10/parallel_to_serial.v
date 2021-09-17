/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #10            Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 10 - Serial Protocol                                         ***
***                                                                         ***
*******************************************************************************
*** Filename: serial_to_parallel.v Created by Jose Luis Martinez, May 2, 2021 ***
***                                                                         ***
******************************************************************************/

`include "definitions.v"

module parallel_to_serial(sys_clk, D_in, send, o_clk, o_data, o_strobe, i_rst);
	input sys_clk, send, i_rst;
	input [7:0] D_in;
	output reg o_clk, o_strobe, o_data;

	reg [1:0] state, nextstate; 
	reg [3:0] count;
	reg [7:0] D_in_reg;

	initial o_clk <= 1'b0;

	always@(state, count, send) begin //next state logic
		case (state)
			2'b00	: // idle state
				if(send) begin nextstate <= 2'b01; end
				else nextstate <= state;
			2'b01	: // send state
				nextstate <= 2'b10;
			2'b10 	: // wait state
				if(count > 7) begin nextstate <= 2'b00; end
				else nextstate <= state;

			default: nextstate <= 2'b00;
		endcase
	end

	always @(posedge sys_clk or i_rst) begin //current state logic
		o_clk <= ~o_clk;
		if (!i_rst) begin
			state <= 2'b00;
		end else state <= nextstate;
	end

	// Output logic
	always@(posedge o_clk, state) begin
		case (state)
			2'b00	:
				begin
					o_data <= 8'b0;
					o_strobe <= 1'b0;
			    end
			2'b01 	:
				begin
					o_strobe <= 1'b0;
					D_in_reg <= D_in;
					o_data <= 8'b0;
			    end
			2'b10 	:
				begin
					o_strobe <= 1'b1;
				end
		endcase
	end

	always@(posedge o_clk) begin
		if(state == 2'b10) begin
			o_data <= D_in_reg[count];
			count <= count + 1;
		end else count <= 0;
	end

endmodule