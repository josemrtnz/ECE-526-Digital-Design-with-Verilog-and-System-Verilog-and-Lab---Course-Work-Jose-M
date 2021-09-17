/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #4             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 4 - 8-bit Register                                           ***
***                                                                         ***
*******************************************************************************
*** Filename: definitions.v Created by Jose Luis Martinez, Febuary 11, 2021 ***
***                                                                         ***
******************************************************************************/

`timescale 1ns/100ps

`define FAN_OUT_1     0.5
`define FAN_OUT_2     0.8
`define FAN_OUT_3     1
`define TIME_DELAY_1  3
`define TIME_DELAY_2  4
`define TIME_DELAY_3  5
`define PRIMARY_OUT   2
`define CLK_PER 50
`define MONITOR_STR_1 "%d: clock = %b, reset = %b, enable = %b, data = %h| register output = %h"

