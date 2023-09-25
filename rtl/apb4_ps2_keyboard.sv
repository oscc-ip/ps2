// Copyright (c) 2023 Beijing Institute of Open Source Chip
// ps2 is licensed under Mulan PSL v2.
// You can use this software according to the terms and conditions of the Mulan PSL v2.
// You may obtain a copy of Mulan PSL v2 at:
//             http://license.coscl.org.cn/MulanPSL2
// THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
// EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
// MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
// See the Mulan PSL v2 for more details.


module apb4_ps2_keyboard (
    // verilog_format: off
    apb4_if.slave apb4,
    // verilog_format: on
    input logic   ps2_clk_i,
    input logic   ps2_dat_i,
    output logic  irq_o
);

  assign apb4.pready = 1'b1;
  assign apb4.pslerr = 1'b0;

endmodule
