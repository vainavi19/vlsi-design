`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2025 16:22:06
// Design Name: 
// Module Name: fullsubtractor
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


module fullsubtractor(
input a,b,cin,
output diff,brf
);
wire p,g;

halfsub HS1(
.a(a), //.ha(fa)
.b(b),
.difh(p),
.bh(g)
);

halfsub HS2(
.a(p),
.b(cin),
.difh(diff),
.bh(w)
);

//data flow
assign brf= g|w;
/*
//structural
or(coutf,g,w);
*/

endmodule 

//half adder module
module halfsub(
input a,b,
output difh,bh
);

//data flow
assign difh=a^b;
assign bh= (~a)&b;
/*
//structural
xor(dif,b);
and(b,a,~b);
*/
endmodule


