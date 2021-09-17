/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #5             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 5 - 8-Bit Counter                                            ***
***                                                                         ***
*******************************************************************************
*** Filename: definitions.v Created by Jose Luis Martinez, Febuary 25, 2021 ***
***                                                                         ***
******************************************************************************/

`timescale 1ns/100ps

`define CLK_PER 20
`define DISPLAY_STRING "%d, clock = %b, reset = %b, enable = %b, load = %b, data = %d | count = %d"