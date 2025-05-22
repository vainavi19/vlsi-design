`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2025 18:39:35
// Design Name: 
// Module Name: jk_ff_tb
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


module jk_ff_tb;
reg j,k,clk,rst;
wire q_nbl, q_bl;

jk_ff dut(
.j(j), .k(k), .clk(clk), .rst(rst), 
.q_nbl(q_nbl), .q_bl(q_bl)
);

//clock generation
initial begin
clk=0;
forever #5 clk=~clk;
end

initial begin 
rst=1;
j=0;k=0; #10;
j=0;k=1; #10;

rst=0;
j=0;k=0; #10;
j=0;k=1; #10;
j=1;k=0; #10;
j=1;k=1; #10;


#40;
$finish;
end

endmodule
