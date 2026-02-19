// Test: Level-sensitive sequential UDP - D latch
primitive udp_dlatch(q, en, d);
  output reg q;
  input en, d;
  table
    // en  d  : q : q_next
       1   0  : ? : 0;
       1   1  : ? : 1;
       0   ?  : ? : -;
       x   0  : 0 : 0;
       x   1  : 1 : 1;
  endtable
endprimitive

// Test: Edge-sensitive sequential UDP - positive-edge D flip-flop
primitive udp_dff(q, clk, d);
  output reg q;
  input clk, d;
  initial q = 0;
  table
    // clk   d  : q : q_next
       (01)  0  : ? : 0;
       (01)  1  : ? : 1;
       (0x)  0  : 0 : 0;
       (0x)  1  : 1 : 1;
       (x1)  0  : 0 : 0;
       (x1)  1  : 1 : 1;
       (?0)  ?  : ? : -;
       (1?)  ?  : ? : -;
  endtable
endprimitive

// Test: Edge-sensitive sequential UDP - negative-edge D flip-flop
primitive udp_dff_n(q, clk, d);
  output reg q;
  input clk, d;
  table
    // clk   d  : q : q_next
       (10)  0  : ? : 0;
       (10)  1  : ? : 1;
       (1x)  0  : 0 : 0;
       (1x)  1  : 1 : 1;
       (x0)  0  : 0 : 0;
       (x0)  1  : 1 : 1;
       (?1)  ?  : ? : -;
       (0?)  ?  : ? : -;
  endtable
endprimitive

// Top-level module instantiating sequential UDPs
module top(input clk, rst, en, d, output q_latch, q_ff, q_ffn);
  udp_dlatch u_latch(q_latch, en, d);
  udp_dff    u_ff   (q_ff,   clk, d);
  udp_dff_n  u_ffn  (q_ffn,  clk, d);
endmodule
