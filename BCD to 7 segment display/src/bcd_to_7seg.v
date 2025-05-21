`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.05.2025 15:34:15
// Design Name: 
// Module Name: bcd_to_7seg
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


module bcd_to_7seg(input [3:0] B, output reg a,b,c,d,e,f,g, [3:0]an);

always @(*) begin
 casex (B)
  4'b0000: begin a=0; b=0; c=0; d=0; e=0; f=0; g=1; end
  4'b0001: begin a=1; b=0; c=0; d=1; e=1; f=1; g=1; end
  4'b0010: begin a=0; b=0; c=1; d=0; e=0; f=1; g=0; end
  4'b0011: begin a=0; b=0; c=0; d=0; e=1; f=1; g=0; end
  4'b0100: begin a=1; b=0; c=0; d=1; e=1; f=0; g=0; end
  4'b0101: begin a=0; b=1; c=0; d=0; e=1; f=0; g=0; end
  4'b0110: begin a=0; b=1; c=0; d=0; e=0; f=0; g=0; end
  4'b0111: begin a=0; b=0; c=0; d=1; e=1; f=1; g=1; end
  4'b1000: begin a=0; b=0; c=0; d=0; e=0; f=0; g=0; end
  4'b1001: begin a=0; b=0; c=0; d=0; e=1; f=0; g=0; end
  default: begin a = 1'bx; b = 1'bx; c = 1'bx; d = 1'bx; e = 1'bx; f = 1'bx; g = 1'bx; end
 endcase
end
/*
//data flow - led is ACTIVE LOW
assign a= ~(B[1] | B[3] | (~B[2] & ~B[0]) | (B[2] & B[0])); 
assign b= ~(~B[2]| (~B[1] & ~B[0]) | (B[1] & B[0]));
assign c= ~(~B[1] | B[0] | B[2]);
assign d= ~((~B[2] & ~B[0]) | (~B[2] & B[1]) | (B[2] & ~B[1] & B[0]) | (B[1] & ~B[0]) | B[3]);
assign e= ~((~B[2] & ~B[0]) | (B[1] & ~B[0]));
assign f= ~((~B[1] & ~B[0]) | (B[2] & ~B[1]) | (B[2] & ~B[0]) | B[3]);
assign g= ~((~B[2] & B[1]) | (B[2] & ~B[1]) | B[3] | (B[2] & ~B[0])); 
*/
assign an = 4'b1110;

endmodule 


