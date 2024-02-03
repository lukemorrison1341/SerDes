`include "uvm_macros.svh"
import uvm_pkg::*;

// Testbench top module
module tb_top;
  
  // UVM testbench components
  bit clk;
  bit rst_n;
  
  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Generate a clock with a period of 10 time units
  end
  
  // Reset generation
  initial begin
    rst_n = 0;
    #15 rst_n = 1; // Release reset after 15 time units
  end

  initial begin
    // Set the UVM verbosity
    uvm_config_db#(uvm_bitstream_t)::set(null, "*", "verbosity", UVM_FULL);
    // Create and run the test
    run_test();
  end

endmodule

// Define the test
class my_test extends uvm_test;

  `uvm_component_utils(my_test)

  my_env m_env; //Declared environment 

  function new(string name = "my_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    m_env = my_env::type_id::create("m_env", this);
  endfunction
  
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
  endtask
  

endclass

// Define the environment
class my_env extends uvm_env;

  `uvm_component_utils(my_env)
  
  // Components of the environment (agents, scoreboard, etc.)
  
  function new(string name = "my_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  // Build phase for creating sub-components
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  
endclass