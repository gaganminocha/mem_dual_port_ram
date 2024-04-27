`include "transaction.sv"

`include "uvm_macros.svh"
import uvm_pkg::*;

class seq extends uvm_sequence#(transaction);
    
    //Factory registry
    `uvm_object_utils(seq)

    transaction tr;

    //constructor
    function new (string inst = "seq");
        super.new(inst);
    endfunction

    //do
    virtual task body();
        repeat(5)
        begin
            `uvm_do(tr);
        end
    endtask

endclass


