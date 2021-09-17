/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #10            Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 10 - Serial Protocol                                         ***
***                                                                         ***
*******************************************************************************
*** Filename: definitions.v      Created by Jose Luis Martinez, May 2, 2021 ***
***                                                                         ***
******************************************************************************/

`timescale 1ns/100ps
`define    WIDTH_TB   8
`define    DEPTH_TB   32
`define    CLK_PER    20
`define    I_CLK_PER  40
`define    STRING     "%d, sys_clk = %b, send = %b, i_rst = %b, D_in = %h | o_strobe = %b, valid = %b, o_clk = %b, o_data = %b, D_out = %h"
