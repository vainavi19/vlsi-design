`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2025 15:15:47
// Design Name: 
// Module Name: fulladder
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


module fulladder(
input a,b,cin,
output sumf,coutf
);
wire p,g;

halfadder HA1(
.a(a), //.ha(fa)
.b(b),
.sumh(p),
.couth(g)
);

halfadder HA2(
.a(p),
.b(cin),
.sumh(sumf),
.couth(w)
);

//data flow
assign coutf= g | w;
/*
//structural
or(coutf,g,w);
*/

endmodule 

//***********************************
//half adder module
module halfadder(
input a,b,
output sumh,couth
);

//data flow
assign sumh=a^b;
assign couth=a&b;
/*
//structural
xor(sumh,a,b);
and(couth,a,b);
*/
endmodule

//***********************************
//***********************************
/* WITHOUT USING HALF-ADDERS
//behavioral modelling

//dataflow

//structural
*/
