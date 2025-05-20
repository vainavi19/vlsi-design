`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2025 16:10:57
// Design Name: 
// Module Name: clk_div_tb
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

/*
module clk_div_tb;
reg clki, rst;
wire clko2, clko4, clko8;

clk_div dut(
.clki(clki), .rst(rst), .clko2(clko2),  .clko4(clko4),  .clko8(clko8)
);
*/
module clk_div_tb;
reg clk, rst;
wire clko;

clk_div4 dut(
.clk(clk), .rst(rst), .clko(clko)
);

initial 
begin
clk =0;
forever #5 clk= ~clk;
end

initial begin 
rst=1; #60;
rst=0; #80;


$finish;
end

endmodule
