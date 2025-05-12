`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.05.2025 13:21:08
// Design Name: 
// Module Name: bcd_to_7seg_tb
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


module bcd_to_7seg_tb;
reg [3:0]B;
wire a,b,c,d,e,f,g;

bcd_to_7seg dut(
.B(B),
.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g)
);

integer k;
initial begin
for (k=0;k<9;k=k+1)
 begin
 B=k; #5;
 end
end

initial begin
$display("BCD | Binary | 7seg display");
$display("---------------------------------------------"); 
$monitor("%0d  | %4b    | %b %b %b %b %b %b %b",k,B,a, b, c, d, e, f, g);
end

endmodule
