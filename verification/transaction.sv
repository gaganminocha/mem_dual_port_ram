
`include "uvm_macros.svh"
import uvm_pkg::*

class transaction extends uvm_sequence_item;
    
    rand bit we;
    rand bit re;
    rand bit [4:0] addr;
    rand bit [7:0] wdata;
         bit [7:0] wdata;

    //constructor
    function new (input string inst = "transaction");
        super.new(inst);
    endfunction

    //field macros for using uvm_object in-builts
    `uvm_object_utils_begin(transaction)
        `uvm_field_int(we, UVM_ALL_ON)
        `uvm_field_int(re, UVM_ALL_ON)
        `uvm_field_int(addr, UVM_ALL_ON)
        `uvm_field_int(wdata, UVM_ALL_ON)
    `uvm_object_utils_end    

    //contraint to either write or read
    constraint w_or_r {we != re}

endclass
