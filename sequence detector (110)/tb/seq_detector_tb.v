`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2025 15:07:09
// Design Name: 
// Module Name: seq_detector_tb
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


module seq_detector_tb;
reg clk, rst;
reg in;
wire out_mo, out_me;
wire [1:0]cstate, nstate, cstate1, nstate1;

seq_detector dut (.clk(clk), .rst(rst), .in(in), .out_mo(out_mo), .out_me(out_me), .cstate(cstate),  .nstate(nstate), .cstate1(cstate1),  .nstate1(nstate1));

//clock
initial begin
clk=0;
forever #5 clk=~clk;
end 

initial begin 
$monitor("cstate=%3b, nstate=%3b,in=%1b,out_mo=%1b,out_me=%1b",cstate,nstate,in,out_mo,out_me);
in=1'b0;
rst=1; #20;

rst=0;
in=1; #10;
in=1; #10;
in=0; #10;
in=1; #10;
in=1; #10;
in=0; #10;

$finish;
end

endmodule
