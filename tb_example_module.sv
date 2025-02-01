///////////////////////////////////////////////////////////////////////////////
//
// EXAMPLE TESTBENCH module
//
// An example testbench module for your Computer Architecture Elements Catalog
//
// module: tb_example_module
// hdl: SystemVerilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
// ensure you note the scale (ns) below in $monitor

`include "./example_module.sv"

module tb_example_module;
    //
    // ---------------- DECLARATIONS OF DATA TYPES ----------------
    //

    //inputs are reg for test bench - or use logic
   reg [3:0] a, b;   //inputs are reg for test bench

    //outputs are wire for test bench - or use logic
   wire [3:0] c;     //outputs are wire for test bench

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (DUT) ----------------
   //
   example_module dut(.A(a), .B(b), .C(c));
   
    //
    // ---------------- INITIALIZE TEST BENCH ----------------
    //
    initial begin : initialize_variables
    end

    initial begin : dump_variables
      $dumpfile("tb_example_module.vcd"); // for Makefile, make dump file same as module name
      $dumpvars(0, dut);
    end

    /*
    * display variables
    */
    initial begin: display_variables
        // note: currently only simple signals or constant expressions may be passed to $monitor.
        $monitor ($time, "ns\ta=%b\tb=%b\tc=%b", a, b, c);
    end

    //
    // ---------------- APPLY INPUT VECTORS ----------------
    //
    // note: following the keyword begin is the name of the block: apply_stimulus
    initial begin : apply_stimuli
      reg[3:0] invect; //invect[3] terminates the for loop
      for (invect = 0; invect < 8; invect = invect + 1)
      begin
         // {a, b, cin} = invect [3:0];
         // #10 $display ("abcin = %b, cout = %b, sum = %b", {a, b, cin}, cout, sum);
         {a} = invect [3:0];
         {b} = ~invect [3:0];
         #10 $display("a=%b, b=%b, c=%b", a, b, c);
      end
      $finish;
   end

endmodule

// `endif // tb_example_module