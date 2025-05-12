`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2025 18:03:13
// Design Name: 
// Module Name: decoder_4to2_tb
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


module decoder_4to2_tb;
reg [0:1] in;
wire [0:3] d;
wire v;

decoder_4to2 dut(
.in(in), //.module(tb)
.d(d)
);

integer k;
initial begin
for (k=0;k<4;k=k+1)
 begin
 in=k; #5;
 end
end

initial begin
$display("io i1 | d");
$display("-------------------");
$monitor("%b %b | %3b  %b %b %b",in[0],in[1],d);

end

//$monitor("in=%4b | e=%2b",in,e);

endmodule

