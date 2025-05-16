`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2025 18:51:21
// Design Name: 
// Module Name: sipo_tb
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


module sipo_tb;
reg si, clk, rst;
wire [3:0]rshift,po;

sipo dut(
.si(si), .clk(clk), .rst(rst), .po(po), .rshift(rshift)
);

initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin 

$display("rst | si | rshift  | po");
$monitor("%0b  %0b   %4b      %4b", rst, si, rshift, po);

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
