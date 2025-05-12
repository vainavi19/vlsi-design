`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2025 09:34:30
// Design Name: 
// Module Name: encoder_8to3_tb
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


module encoder_8to3_tb;
reg [0:7] in;
wire [0:2] e;
wire v;


encoder_8to3 dut(
.in(in), //.module(tb)
.e(e),
.v(v)
);

integer k;
initial begin
for (k=0;k<128;k=k+1)
 begin
 in=k; #5;
 end
end

initial begin
$display("in   | e     v");
$display("---------------------");
$monitor("%0d %8b %3b %0b",k,in,e,v);



end

//$monitor("in=%4b | e=%2b",in,e);

endmodule

