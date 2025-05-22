`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2025 17:59:27
// Design Name: 
// Module Name: t_ff_tb
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


module t_ff_tb;

reg t,clk,en, rst;
wire q, qb;

t_ff dut(
.t(t),
.clk(clk),
.en(en),
.rst(rst),
.q_nbl(q_nbl),
.qB_nbl(qB_nbl),
.q_bl(q_bl),
.qB_bl(qB_bl),
.ql(ql),
.qBl(qBl)
);

initial begin
 clk =0;
 forever #5 clk= ~clk;
end

initial begin

rst=1; 
en=0;
t=0; #15;
t=1; #15;

rst=0;
en=1;
t=0; #15;
t=1; #15;
en=0;
t=0; #15;
t=1; #15;

#100;
$finish; 
end

endmodule
