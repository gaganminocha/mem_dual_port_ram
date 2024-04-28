`include "sequence.sv"

`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_driver;

    //factory registry
    `uvm_component_utils(driver)

    transaction tr;

    //constructor
    function new(string inst = "driver", uvm_component parent = null);
        super.new(inst, parent);
    endfunction

    //build_phase
    virtual function void build_phase(uvm_phase phase); 
        tr = transaction::type_id::create("tr");
    endfunction

    //run phase
    virtual task run_phase(uvm_phase phase);
        forever
        begin
            seq_item_port.get_seq_item(tr);
            `uvm_info("DRV", "Inside Driver", UVM_MEDIUM)
            seq_item_port.item_done();


        end
    endtask
    
endclass
