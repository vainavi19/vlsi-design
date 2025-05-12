`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2025 18:57:41
// Design Name: 
// Module Name: encoder_4to2_tb
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


module encoder_4to2_tb;
reg [0:3] in;
wire [0:1] e;

encoder_4to2 dut(
.in(in), //.module(tb)
.e(e)
);

integer k;
initial begin
for (k=0;k<16;k=k+1)
 begin
 in=k; #5;
 end
end

initial begin
$display("io i1 i2 i3 | e0 e1");
$display("-------------------");
$monitor("%b  %b  %b  %b | %b  %b",in[0],in[1],in[2],in[3],e[0],e[1]);
end

//$monitor("in=%4b | e=%2b",in,e);

endmodule
