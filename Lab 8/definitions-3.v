/******************************************************************************
*** 																        ***
*** ECE 526 L Experiment #8             Jose Luis Martinez, Spring, 2021    ***
***                                                                         ***
*** Experiment 8 - Arithmetic Logic Unit                                    ***
***                                                                         ***
*******************************************************************************
*** Filename: definitions.v   Created by Jose Luis Martinez, April 16, 2021 ***
***                                                                         ***
******************************************************************************/

`timescale 1ns/100ps
`define    WIDTH_TB   8
`define    CLK_PER    20
`define    ALU_ADD_TB 4'b0010
`define    ALU_SUB_TB 4'b0011
`define    ALU_AND_TB 4'b0100
`define    ALU_OR_TB  4'b0101
`define    ALU_XOR_TB 4'b0110
`define    ALU_NOT_TB 4'b0111
`define    STRING     "%d, OPCODE = %h, A = %d, B = %d, EN = %b, OE = %b, CLK = %b| CF = %b, ZF = %b, SF = %b, OF = %b, ALU_OUT = %d"
`define    STRINGF    "%d, OPCODE = %h, A = %b, B = %b, EN = %b, OE = %b, CLK = %b| CF = %b, ZF = %b, SF = %b, OF = %b, ALU_OUT = %b"
