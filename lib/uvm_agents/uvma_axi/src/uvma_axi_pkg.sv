// Copyright 2022 Thales DIS SAS
//
// Licensed under the Solderpad Hardware Licence, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.0
// You may obtain a copy of the License at https://solderpad.org/licenses/
//
// Original Author: Alae Eddine EZ ZEJJARI (alae-eddine.ez-zejjari@external.thalesgroup.com)
// Co-Author: Abdelaali Khardazi

/***** AXI4 slave agent package *****/

`ifndef __UVMA_AXI_PKG_SV__
`define __UVMA_AXI_PKG_SV__

// Pre-processor macros
`include "uvm_macros.svh"
`include "uvma_axi_macros.sv"

// Interfaces / Modules / Checkers
`include "uvma_axi_intf.sv"
`include "uvma_axi_assert.sv"
`include "uvma_axi_aw_assert.sv"
`include "uvma_axi_w_assert.sv"
`include "uvma_axi_ar_assert.sv"
`include "uvma_axi_r_assert.sv"
`include "uvma_axi_b_assert.sv"

package uvma_axi_pkg;

   import uvm_pkg::*;

   localparam NrSlaves      = 2; // actually masters, but slaves on the crossbar
   localparam IdWidth       = 4; // 4 is recommended by AXI standard, so lets stick to it, do not change
   localparam IdWidthSlave  = IdWidth + $clog2(NrSlaves);
   parameter AXI_ADDR_WIDTH = `UVMA_AXI_ADDR_MAX_WIDTH;
   parameter AXI_DATA_WIDTH = `UVMA_AXI_DATA_MAX_WIDTH;
   parameter AXI_USER_WIDTH = `UVMA_AXI_USER_MAX_WIDTH;
   parameter AXI_ID_WIDTH   = IdWidthSlave;
   parameter NUM_WORDS      = 2**24;

   parameter AXI_AWREADY_DLY = 3;   //aw_ready goes low for a random number of clk cycles (between 0 and AXI_AWREADY_DLY)
   parameter AXI_WREADY_DLY  = 3;   //w_ready goes low for a random number of clk cycles (between 0 and AXI_WREADY_DLY)
   parameter AXI_BVALID_DLY  = 3;   //b_valid goes low for a random number of clk cycles (between 0 and AXI_BVALID_DLY)
   parameter AXI_ARREADY_DLY = 4;   //ar_ready goes low for a random number of clk cycles (between 0 and AXI_ARREADY_DLY)

    // Objects
   `include "uvma_axi_cntxt.sv"

   // AW
   `include "uvma_axi_aw_item.sv"
   `include "uvma_axi_aw_mon.sv"
   `include "uvma_axi_aw_agent.sv"

   // W
   `include "uvma_axi_w_item.sv"
   `include "uvma_axi_w_mon.sv"
   `include "uvma_axi_w_agent.sv"

   // B
   `include "uvma_axi_b_item.sv"
   `include "uvma_axi_b_mon.sv"
   `include "uvma_axi_b_agent.sv"

   // AR
   `include "uvma_axi_ar_item.sv"
   `include "uvma_axi_ar_mon.sv"
   `include "uvma_axi_ar_agent.sv"

   // R
   `include "uvma_axi_r_item.sv"
   `include "uvma_axi_r_mon.sv"
   `include "uvma_axi_r_agent.sv"

   //Top Agent
   `include "uvma_axi_agent.sv"

endpackage : uvma_axi_pkg

`endif
