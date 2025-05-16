`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2025 18:49:15
// Design Name: 
// Module Name: siso_tb
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


module siso_tb;
reg si, clk, rst;
wire  so;
wire [3:0]rshift;

siso dut(
.si(si), .clk(clk), .rst(rst), .so(so), .rshift(rshift)
);

initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin 

$display("rst | si | rshift  | so");
$monitor("%0b  %0b   %4b      %0b", rst, si, rshift, so);

rst=1;si=0;
#10;

rst=0;
si=0; #10;
si=1; #10;
si=1; #10;
si=0; #10;
si=1; #10;
si=1; #10;
$finish;
end

endmodule