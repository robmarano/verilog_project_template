///////////////////////////////////////////////////////////////////////////////
//
// EXAMPLE module
//
// An example module for your Computer Architecture Elements Catalog
//
// module: example
// hdl: Verilog
//
// author: Prof. Rob Marano
//
///////////////////////////////////////////////////////////////////////////////

`ifndef EXAMPLE
`define EXAMPLE

module example(A, B, C);

   input  [3:0] A, B;
   output [3:0] C;

   // mix up the input bits
   assign C = { A[0], B[2], A[1], B[3] };

endmodule

`endif // EXAMPLE