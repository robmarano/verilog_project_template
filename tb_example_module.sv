///////////////////////////////////////////////////////////////////////////////
//
// EXAMPLE TESTBENCH module
//
// An example testbench module for your Computer Architecture Elements Catalog
//
// module: tb_example_module
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "./example_module.sv"

module tb_example_module;

   reg [3:0] a, b;   //inputs are reg for test bench
   wire [3:0] c;     //outputs are wire for test bench
   
   //
   // ---------------- INITIALIZE TEST BENCH ----------------
   //
   initial
     begin
        $dumpfile("tb_example_module.vcd"); // for Makefile, make dump file same as module name
        $dumpvars(0, uut);
      //   $monitor("A is %b, B is %b, C is %b", a, b, c);
      //   #50 A = 4'b1100;
      //   #50 $finish;
     end

   //apply input vectors
   initial
   begin: apply_stimulus
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

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (UUT) ----------------
   //
   example_module uut(.A(a), .B(b), .C(c));

endmodule

// `endif // tb_example_module