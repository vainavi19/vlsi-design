`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2025 10:01:20
// Design Name: 
// Module Name: d_flipflop_tb
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


module d_flipflop_tb;
reg d, clk,en, rst;
wire q_bl, q_nbl, q_l,qb_bl, qb_nbl, qb_l;

d_flipflop dut (
.d(d),
.clk(clk),
.rst(rst),
.en(en),
.q_nbl(q_nbl),
.qb_nbl(qb_nbl),
.q_bl(q_bl),
.qb_bl(qb_bl),
.q_l(q_l),
.qb_l(qb_l)
);

initial begin
 clk = 0;
 forever #5 clk = ~clk; // 5ns half period 
end

initial begin 
$display("rst | clk | d | q | qb");
//$monitor("%0b | %0b | %0b| %0b | %0b",rst, clk, d);

 rst = 1; en=0; 
 d = 0;#10;
 d = 1;#10;  // for one clock cycle

 rst = 0; en=1; 
 d = 0; #10;
 d = 1; #10;
 en=0; 
 d = 0; #10;
 d = 1; #10;
 
 
 $finish;
end

endmodule
