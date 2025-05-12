`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2025 23:50:37
// Design Name: 
// Module Name: encoder_8to3
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

//PRIORITY 8-TO-3 ENCODER USING 4-TO-2 ENCODERS
//OCTAL TO BINARY CONVERTER 
module encoder_8to3(
input wire [7:0] in,
output wire [2:0] e,
output wire v
);
wire [2:0] eu,ed;
wire vu,vd;

// Instantiate the two 4-to-2 encoders
p_encoder_4to2 up (
.in(in[7:4]),
.e(eu),
.v(vu)
);

p_encoder_4to2 down (
.in(in[3:0]),
.e(ed),
.v(vd)
);

// dataflow
assign v = vu | vd;

assign e[2] = vd;  // Indicates which half of the 8 inputs is active
assign e[1] = (eu[1] & ~vd) | (ed[1] & vd);
assign e[0] = (eu[0] & ~vd) | (ed[0] & vd);

//gate level
wire w1,w2,w3,w4;
or(v, vu,vd);

and(w2,eu[0],~vd);
and(w3,ed[0],vd);
or(e[0],w2,w3);

and(w1,eu[1],~vd);
and(w4,ed[1],vd);
and(e[2], 1,vd);

endmodule



//*****************************************************************
module p_encoder_4to2(
input wire [3:0] in,
output wire [1:0] e,
output wire v
);

/*
//dataflow
assign e[0] = (in[1] & ~in[0]) | in[0];
assign e[1] = (in[2] & ~in[1] & ~in[0]) | in[0];
assign v = in[0] | in[1] | in[2] | in[3];  // v is high if any input is high
*/


//gate level
wire w1,w2,w3,w4;
not(w1,in[0]);
and(w2,w1,in[1]);
or(e[1],in[0],w2);

not(w3,in[1]);
and(w4,w1,w3,in[2]);
or(e[0],w4,in[0]);

or(v,in[0],in[1],in[2],in[3]);

endmodule
