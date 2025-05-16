`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2025 19:00:38
// Design Name: 
// Module Name: pipo_tb
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


module pipo_tb;
reg clk, rst;
reg [3:0]pi;
wire [3:0]po;

pipo dut(
.pi(pi), .clk(clk), .rst(rst), .po(po)
);

initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin 

$display("rst | pi | po");
$monitor("%0b %4b   %4b", rst, pi, po);

rst=1;pi=4'd0;
#10;

rst=0;
pi=4'd1; #10;
pi=4'd3; #10;
pi=4'd0; #10;
$finish;
end

endmodule 