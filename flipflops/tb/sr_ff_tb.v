`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2025 18:46:12
// Design Name: 
// Module Name: sr_ff_tb
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


module sr_ff_tb;
reg s,r,clk,rst;
wire q_nbl, q_bl;

sr_ff dut(
.s(s), .r(r), .clk(clk), .rst(rst), 
.q_nbl(q_nbl), .q_bl(q_bl)
);

//clock generation
initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin 
rst=1;
s=0;r=0; #10;
s=0;r=1; #10;

rst=0;
s=0;r=0; #10;
s=0;r=1; #10;
s=1;r=0; #10;
s=1;r=1; #10;

s=0;r=0; #10;


#10;
$finish;
end

endmodule
