/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #10            Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 10 - Serial Protocol                                         ***
***                                                                         ***
*******************************************************************************
*** Filename: serial_to_parallel.v    Created by Jose Luis Martinez, May 2, 2021 ***
***                                                                         ***
******************************************************************************/

`include "definitions.v"

module serial_to_parallel(sys_clk, i_clk, i_strobe, i_rst, i_data, D_out, valid);
	input sys_clk, i_clk, i_strobe, i_rst, i_data;
	output reg [7:0] D_out;
	output reg valid;

	reg [1:0] state, nextstate; 
	reg [3:0] count;

	always@(state, count, i_strobe) begin //next state logic
		case (state)
			2'b00	: // idle state
				if(i_strobe) begin nextstate <= 2'b01; end
				else nextstate <= state;
			2'b01	: // receiving state
				if(count > 7) begin nextstate <= 2'b10; end
				else nextstate <= state;
			2'b10 	: // valid state
				nextstate <= 2'b0;
			default: nextstate <= 2'b00;
		endcase
	end

	always @(posedge sys_clk, negedge i_rst) begin //current state logic
		if (!i_rst) begin
			state <= 2'b00;
		end else state <= nextstate;
	end

	// Output logic
	always@(state) begin
		case (state)
			2'b00	:
				begin
					valid <= 0;
			    end
			2'b01 	:
				begin
					valid <= 0;
			    end
			2'b10 	:
				begin
					valid <= 1;
				end
		endcase
	end

	always@(negedge i_clk) begin
		if (state == 2'b01) begin
			D_out[count] <= i_data;
			count <= count + 1;
		end else begin
			count <= 3'b000;
		end
	end

endmodule