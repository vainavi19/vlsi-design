`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2025 16:33:15
// Design Name: 
// Module Name: bidirec_tb
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


module bidirec_tb;
reg clk, rst;
reg [3:0]in;
reg [1:0]sel;
wire [3:0]out;

bidirec dut (
.clk(clk), .rst(rst), .sel(sel), .in(in), .out(out)
);

initial begin
clk =0;
forever #5 clk= ~clk;
end

initial begin 
$monitor("clk = %0b, rst= %0b, sel=%2b, in=%4b, out=%4b", clk,rst,sel,in,out);
rst=1; #20;

rst=0; 
in= 4'b1001;
sel=11; #10; //no change
sel=01; #20; // left shift
sel=00; #20; // no change
sel=10; #40; // right shift


sel= 11;
in = 4'b1101; 
#10;



$finish;
end

endmodule
