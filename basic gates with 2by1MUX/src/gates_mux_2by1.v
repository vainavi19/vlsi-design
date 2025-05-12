`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2025 00:09:33
// Design Name: 
// Module Name: gates_mux_2by1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module gates_mux_2by1 (
input a,b,
output c_and, c_or, c_not, c_xor, c_xnor, c_nand, c_nor
);


mux_2by1 AND(
.in0(1'b0),
.in1(b),
.s(a),
.out(c_and)
);

mux_2by1 OR(
.in0(b),
.in1(1'b1),
.s(a),
.out(c_or)
);

mux_2by1 NOT(
.in0(1'b1),
.in1(1'b0),
.s(b),
.out(c_not)
);

mux_2by1 XOR(
.in0(b),
.in1(c_not),
//.in1(~b),
.s(a),
.out(c_xor)
);

mux_2by1 XNOR(
.in0(c_not),
//.in0(~b),
.in1(b),
.s(a),
.out(c_xnor)
);

mux_2by1 NAND(
.in0(1'b1),
.in1(c_not),
//.in1(~b),
.s(a),
.out(c_nand)
);

mux_2by1 NOR(
.in0(c_not),
//.in0(~b),
.in1(1'b0),
.s(a),
.out(c_nor)
);

endmodule



module mux_2by1(
input in0,in1,s,
output out
);

assign out = (~s & in0) | (s & in1);

endmodule
