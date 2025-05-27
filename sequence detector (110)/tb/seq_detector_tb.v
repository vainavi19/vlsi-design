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
wire out;
wire [1:0]cstate, nstate;

seq_detector dut (.clk(clk), .rst(rst), .in(in), .out(out), .cstate(cstate),  .nstate(nstate));

//clock
initial begin
clk=0;
forever #5 clk=~clk;
end 

initial begin 
$monitor("cstate=%3b, nstate=%3b,in=%1b,out=%1b",cstate,nstate,in,out);
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
