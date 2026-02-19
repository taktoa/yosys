// Test: Combinational UDP - AND gate
primitive udp_and(out, a, b);
  output out;
  input a, b;
  table
    // a  b : out
       0  0 : 0;
       0  1 : 0;
       1  0 : 0;
       1  1 : 1;
       0  x : 0;
       x  0 : 0;
       1  x : x;
       x  1 : x;
       x  x : x;
  endtable
endprimitive

// Test: Combinational UDP with ? wildcard
primitive udp_or(out, a, b);
  output out;
  input a, b;
  table
    // a  b : out
       0  0 : 0;
       1  ? : 1;
       ?  1 : 1;
       0  x : x;
       x  0 : x;
  endtable
endprimitive

// Instantiation test module
module top(input a, b, output y_and, y_or);
  udp_and u_and(y_and, a, b);
  udp_or  u_or (y_or,  a, b);
endmodule
