// Copyright (c) 2023-2024 Miao Yuchi <miaoyuchi@ict.ac.cn>
// ps2 is licensed under Mulan PSL v2.
// You can use this software according to the terms and conditions of the Mulan PSL v2.
// You may obtain a copy of Mulan PSL v2 at:
//             http://license.coscl.org.cn/MulanPSL2
// THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
// EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
// MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
// See the Mulan PSL v2 for more details.

`ifndef INC_PS2_DEF_SV
`define INC_PS2_DEF_SV

/* register mapping
 * PS2_CTRL:
 * BITS:   | 31:2 | 1  | 0   |
 * FIELDS: | RES  | EN | ITN |
 * PERMS:  | NONE | RW | RW  |
 * ---------------------------
 * PS2_DATA:
 * BITS:   | 31:8 | 7:0  |
 * FIELDS: | RES  | DATA |
 * PERMS:  | NONE | RO   |
 * ---------------------------
 * PS2_STAT:
 * BITS:   | 31:1 | 0   |
 * FIELDS: | RES  | ITF |
 * PERMS:  | NONE | RO  |
 * ---------------------------
*/

// verilog_format: off
`define PS2_CTRL 4'b0000 // BASEADDR + 0x00
`define PS2_DATA 4'b0001 // BASEADDR + 0x04
`define PS2_STAT 4'b0010 // BASEADDR + 0x08

`define PS2_CTRL_ADDR {26'b0, `PS2_CTRL, 2'b00}
`define PS2_DATA_ADDR {26'b0, `PS2_DATA, 2'b00}
`define PS2_STAT_ADDR {26'b0, `PS2_STAT, 2'b00}

`define PS2_CTRL_WIDTH 2
`define PS2_DATA_WIDTH 8
`define PS2_STAT_WIDTH 1
// verilog_format: on

interface ps2_if ();
  logic ps2_clk_i;
  logic ps2_dat_i;
  logic irq_o;

  modport dut(input ps2_clk_i, input ps2_dat_i, output irq_o);
  modport tb(output ps2_clk_i, output ps2_dat_i, input irq_o);
endinterface

`endif
