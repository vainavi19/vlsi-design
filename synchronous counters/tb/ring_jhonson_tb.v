`timescale 10ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.05.2025 10:47:01
// Design Name: 
// Module Name: counter_tb
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


module counter_tb;
reg clk, rst;
wire [3:0] out;
wire clk_1hz;

counter dut( .clk(clk), .rst(rst), .out(out), .clk_1hz(clk_1hz) );

initial begin 
clk=0;
forever #0.5 clk=~clk;
end 

initial begin
rst=1; #2;
rst=0;
end 

endmodule
