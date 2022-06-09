// Copyright 2022 Thales DIS SAS
//
// Licensed under the Solderpad Hardware Licence, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.0
// You may obtain a copy of the License at https://solderpad.org/licenses/
//
// Original Author: Alae Eddine EZ ZEJJARI (alae-eddine.ez-zejjari@external.thalesgroup.com)
// Co-Author: Abdelaali Khardazi

`ifndef __UVMA_AXI_CNTXT_SV__
`define __UVMA_AXI_CNTXT_SV__

/**
 * Object encapsulating all state variables for all AXI agent
 * (uvma_axi_agent_c) components.
 */
class uvma_axi_cntxt_c extends uvm_object;

   // Handle to agent interface
   virtual uvma_axi_intf  axi_vi;

   // Events
   uvm_event  sample_cfg_e;
   uvm_event  sample_cntxt_e;

   `uvm_object_utils_begin(uvma_axi_cntxt_c)
      `uvm_field_event(sample_cfg_e, UVM_DEFAULT)
      `uvm_field_event(sample_cntxt_e, UVM_DEFAULT)
   `uvm_object_utils_end

   /**
    * Builds events.
    */
   extern function new(string name = "uvma_axi_cntxt");

endclass : uvma_axi_cntxt_c


function uvma_axi_cntxt_c::new(string name = "uvma_axi_cntxt");

   super.new(name);

   sample_cfg_e   = new("sample_cfg_e"  );
   sample_cntxt_e = new("sample_cntxt_e");

endfunction : new

`endif // __UVMA_AXI_CNTXT_SV__
