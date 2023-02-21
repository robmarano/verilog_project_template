///////////////////////////////////////////////////////////////////////////////
//
// EXAMPLE module
//
// An example module for your Computer Architecture Elements Catalog
//
// module: example
// hdl: Verilog
//
// author: Your Name <your.name@cooper.edu>
//
///////////////////////////////////////////////////////////////////////////////

`ifndef EXAMPLE
`define EXAMPLE

module example(A, B, C);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input  [3:0] A, B;
   output [3:0] C;

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

   // mix up the input bits
   assign C = { A[0], B[2], A[1], B[3] };

endmodule

`endif // EXAMPLE