/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #9             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 9 - Parameterized Synchronous FIFO                           ***
***                                                                         ***
*******************************************************************************
*** Filename: definitions.v   Created by Jose Luis Martinez, April 28, 2021 ***
***                                                                         ***
******************************************************************************/

`timescale 1ns/100ps
`define    WIDTH_TB   8
`define    DEPTH_TB   32
`define    CLK_PER    20
`define    ALU_NOT_TB 4'b0111
`define    STRING     "%d, data_in = %b, clk = %b, wr_en = %b, rd_en = %b, rst = %b | data_out = %b, empty = %b, a_e = %b, full = %b, a_f = %b, valid = %b, of = %b, uf = %b, count = %d"
