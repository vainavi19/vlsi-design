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
//8-to-3 encoder - behavioral modelling 
module encoder_8to3 (
input [7:0] in,
output reg [2:0] e
);

always @(in) begin
casex(in)
8'b00000001: e=3'b000;
8'b00000010: e=3'b001;
8'b00000100: e=3'b010;
8'b00001000: e=3'b011;
8'b00010000: e=3'b100;
8'b00100000: e=3'b101; 
8'b01000000: e=3'b110; 
8'b10000000: e=3'b111; 
default: e=3'bx;
endcase 
end 
endmodule


/////////////////////////////////////////////////////
//8-to-3 encooder - dataflow modelling 
module encoder_8to3(
input [7:0] in,
output [2:0] e
);

assign e[0]=in[1] | in[3] | in[5] | in[7];
assign e[1]=in[2] | in[3] | in[6] | in[7];
assign e[2]=in[4] | in[5] | in[6] | in[7];
endmodule
/////////////////////////////////////////////////////
//8-to-3 encooder - gate level modelling 
module encoder_8to3(
input [7:0] in,
output [2:0] e
);
wire g1, g2, g3;

or g1(e[0],in[1],in[3],in[5],in[7]);
or g2(e[1],in[2],in[3],in[6],in[7]);
or g3(e[2],in[4],in[5],in[6],in[7]);
endmodule
