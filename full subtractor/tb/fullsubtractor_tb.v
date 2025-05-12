`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2025 16:25:47
// Design Name: 
// Module Name: fullsubtractor_tb
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


module fullsubtractor_tb;
reg a,b,cin;
wire dif,br;
integer i;

fullsubtractor dut(
.a(a), //.module(tb)
.b(b),
.cin(cin),
.diff(dif),
.brf(br)
);

initial begin
for (i=0;i<8;i=i+1)
begin
{a,b,cin}=i; #5;
end
end

initial 
$monitor("a=%b b=%b cin=%b | dif=%b br=%b",a,b,cin,dif,br);


endmodule 
