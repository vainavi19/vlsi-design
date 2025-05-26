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
//8-to-3 encooder using two 4-to-2 encoders
//also acts as octal to binary code converter 
module p_encoder_8to3(
input wire [7:0] in,
output wire [2:0] e,
output wire v
);
wire [2:0] eu,ed;
wire vu,vd;

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

// dataflow - combinational ckt after 4-to-2 encoders
assign v = vu | vd;

assign e[2] = vd;  // Indicates which half of the 8 inputs is active
assign e[1] = (eu[1] & ~vd) | (ed[1] & vd);
assign e[0] = (eu[0] & ~vd) | (ed[0] & vd);

//gate level - combinational ckt after 4-to-2 encoders
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


//dataflow
assign e[0] = (in[1] & ~in[0]) | in[0];
assign e[1] = (in[2] & ~in[1] & ~in[0]) | in[0];
assign v = in[0] | in[1] | in[2] | in[3];  // v is high if any input is high



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


/////////////////////////////////////////////////////
//8-to-3 encooder - behavioral modelling 
module p_encoder_8to3 (
input [7:0] in,
output reg [2:0] e
);

always @(in) begin
casex(in)
8'b00000001: e=3'b000;
8'b0000001x: e=3'b001;
8'b000001xx: e=3'b010;
8'b00001xxx: e=3'b011;
8'b0001xxxx: e=3'b100;
8'b001xxxxx: e=3'b101; 
8'b01xxxxxx: e=3'b110; 
8'b1xxxxxxx: e=3'b111; 
default: e=3'bx;
endcase 
end 
endmodule


/////////////////////////////////////////////////////
//8-to-3 encooder - dataflow modelling 
module p_encoder_8to3(
input [7:0] in,
output [2:0] e
);

assign e = (in[7] ==1'b1 ) ? 3'b111:
(in[6] ==1'b1 ) ? 3'b110:
(in[5] ==1'b1 ) ? 3'b101:
(in[4] ==1'b1) ? 3'b100:
(in[3] ==1'b1) ? 3'b011:
(in[2] ==1'b1) ? 3'b010:
(in[1] ==1'b1) ? 3'b001:
(in[0] ==1'b1) ? 3'b000: 3'bxxx;
endmodule

  
