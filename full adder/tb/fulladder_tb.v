`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2025 15:16:44
// Design Name: 
// Module Name: fulladder_tb
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


module fulladder_tb;
reg a,b,cin;
wire sum,cout;
integer i;

fulladder dut(
.a(a), //.tb(module)
.b(b),
.cin(cin),
.sumf(sum),
.coutf(cout)
);

initial begin
for (i=0;i<8;i=i+1)
begin
{a,b,cin}=i; #5;
end
end

initial 
$monitor("a=%b b=%b cin=%b | sum=%b cout=%b",a,b,cin,sum,cout);


endmodule 

