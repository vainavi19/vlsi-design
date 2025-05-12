`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2025 00:10:43
// Design Name: 
// Module Name: gates_mux_2by1_tb
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


module gates_mux_2by1_tb;
reg a,b;
wire c_and, c_or, c_not,c_xor, c_xnor, c_nand, c_nor;

gates_mux_2by1 dut(
.a(a), //.module(tb)
.b(b),
.c_and(c_and),
.c_or(c_or),
.c_not(c_not),
.c_xor(c_xor),
.c_xnor(c_xnor),
.c_nor(c_nor),
.c_nand(c_nand)
);

integer k;
initial begin
for (k=0;k<4;k=k+1)
 begin
 {a,b}=k;
 #5;
 end
end

endmodule
